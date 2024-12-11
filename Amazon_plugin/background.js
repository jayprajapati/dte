let intervalId = null;


let apilocale, apicountry, urlIndex, countryCode;

// const country = "Canada"; // https://hiring.amazon.ca/app#/jobSearch
const country = "United States"; // https://hiring.amazon.com/app#/jobSearch


if (country === "Canada") {
    apilocale = "en-CA";
    apicountry = "Canada";
    urlIndex = "ca";
    countryCode = "CA";
} else if (country === "United States") {
    apilocale = "en-US";
    apicountry = "United States";
    urlIndex = "com";
    countryCode = "US";
} else {
    throw new Error("Unsupported country");
}

console.log({ apilocale, apicountry, urlIndex, countryCode });

let selectedJobId = null; // Global variable for jobId
let selectedScheduleId = null; // Global variable for scheduleId
let candidateId = null; // Global variable for candidateId
let applicationId = null; // Global variable for applicationId
let accessToken = null; // Global variable for accessToken
let sessionToken = null; // Global variable for sessionToken

chrome.runtime.onMessage.addListener((message) => {
  if (message.action === "startQuery") {
    if (intervalId) return; // Prevent multiple intervals
    intervalId = setInterval(queryJobs, 250);
  } else if (message.action === "stopQuery") {
    clearInterval(intervalId);  
    intervalId = null;
  }
});

async function queryJobs() {
  const sessionToken = await getSessionToken();
  const response = await fetch("https://e5mquma77feepi2bdn4d6h3mpu.appsync-api.us-east-1.amazonaws.com/graphql", {
    method: "POST",
    headers: {
      "accept": "*/*",
      "authorization": `Bearer Status|unauthenticated|Session|${sessionToken}`,
      "content-type": "application/json"
    },
    body: JSON.stringify({
      operationName: "searchJobCardsByLocation",
      variables: {
        searchJobRequest: {
          locale: apilocale,
          country: apicountry,
          keyWords: "",
          equalFilters: [],
          containFilters: [
            {
              key: "isPrivateSchedule",
              val: ["false"]
            }
          ],
          rangeFilters: [],
          orFilters: [],
          dateFilters: [
            {
              key: "firstDayOnSite",
              range: {
                startDate: "2024-12-09"
              }
            }
          ],
          sorters: [],
          pageSize: 100,
          // geoQueryClause: {
          //   lat: 53.51877983,
          //   lng: -113.659426544,
          //   unit: "km",
          //   distance: 150
          // }
        }
      },
      query: `query searchJobCardsByLocation($searchJobRequest: SearchJobRequest!) {
    searchJobCardsByLocation(searchJobRequest: $searchJobRequest) {
      nextToken
      jobCards {
        jobId
        language
        dataSource
        requisitionType
        jobTitle
        jobType
        employmentType
        city
        state
        postalCode
        locationName
        totalPayRateMin
        totalPayRateMax
        tagLine
        bannerText
        image
        jobPreviewVideo
        distance
        featuredJob
        bonusJob
        bonusPay
        scheduleCount
        currencyCode
        geoClusterDescription
        surgePay
        jobTypeL10N
        employmentTypeL10N
        bonusPayL10N
        surgePayL10N
        totalPayRateMinL10N
        totalPayRateMaxL10N
        distanceL10N
        monthlyBasePayMin
        monthlyBasePayMinL10N
        monthlyBasePayMax
        monthlyBasePayMaxL10N
        jobContainerJobMetaL1
        virtualLocation
        poolingEnabled
        __typename
      }
      __typename
    }
  }`
    })
  });

  const data = await response.json();
  const jobCards = data?.data?.searchJobCardsByLocation?.jobCards || [];
  console.log(JSON.stringify(jobCards));
  if (jobCards.length > 0) {
    clearInterval(intervalId);
    intervalId = null;

    selectedJobId = jobCards[0].jobId; // Save jobId to global variable
    console.log("Selected Job ID:", selectedJobId);

    console.log("Job found:", jobCards[0]);
    chrome.notifications.create({
      type: "basic",
      iconUrl: "icon.png",
      title: "Job Found",
      message: `Job Title: ${jobCards[0].jobTitle}`
    });

    querySchedules(selectedJobId, sessionToken); // Fetch schedules for the selected job
  }
}



async function querySchedules(jobId, sessionToken) {
  const response = await fetch("https://e5mquma77feepi2bdn4d6h3mpu.appsync-api.us-east-1.amazonaws.com/graphql", {
    method: "POST",
    headers: {
      "accept": "*/*",
      "authorization": `Bearer ${sessionToken}`,
      "content-type": "application/json"
    },
    body: JSON.stringify({
      operationName: "searchScheduleCards",
      variables: {
        searchScheduleRequest: {
          locale: apilocale,
          country: apicountry,
          jobId: jobId, // Use the jobId from the previous query
          pageSize: 1000,
          sorters: [{ fieldName: "totalPayRateMax", ascending: "false" }],
          dateFilters: [{ key: "firstDayOnSite", range: { startDate: new Date().toISOString().split('T')[0] } }]
        }
      },
      query: `query searchScheduleCards($searchScheduleRequest: SearchScheduleRequest!) {
        searchScheduleCards(searchScheduleRequest: $searchScheduleRequest) {
          nextToken
          scheduleCards {
            scheduleId
            scheduleText
            totalPayRate
          }
        }
      }`
    })
  });

  const data = await response.json();
  const scheduleCards = data?.data?.searchScheduleCards?.scheduleCards || [];

  if (scheduleCards.length > 0) {
    selectedScheduleId = scheduleCards[0].scheduleId; // Save scheduleId to global variable
    console.log("Selected Schedule ID:", selectedScheduleId);

    console.log("Schedule found:", scheduleCards[0]);
    chrome.notifications.create({
      type: "basic",
      iconUrl: "icon.png",
      title: "Schedule Found",
      message: `Schedule: ${scheduleCards[0].scheduleText}`
    });

    const accessToken = await getAccessToken();
    await queryCandidateId(accessToken); // Query for candidateId before opening the URL
  }
}

async function queryCandidateId(accessToken) {
  const sessionToken = await getSessionToken();

  const response = await fetch(`https://auth.hiring.amazon.${urlIndex}/api/authorize?countryCode=${countryCode}`, {
    headers: {
      "accept": "application/json, text/plain, */*",
      "accept-language": "en-US,en;q=0.9",
      "authorization": accessToken,
      "content-type": "application/json",
      "csrf-token": sessionToken,
    },
    method: "POST",
    body: JSON.stringify({
      redirectUrl: `hiring.amazon.${urlIndex}`,
      token: sessionToken
    })
  });

  const data = await response.json();
  if (data && data.candidateId) {
    candidateId = data.candidateId; // Save candidateId in global variable
    console.log("Candidate ID:", candidateId);

    openApplicationUrl(accessToken); // Open the application URL after saving candidateId
  } else {
    console.error("Failed to retrieve candidateId.");
    chrome.notifications.create({
      type: "basic",
      iconUrl: "icon.png",
      title: "User not logged in",
      message: `Log in to retrieve candidate ID`
    });
  }
}

function openApplicationUrl(accessToken) {
  if (selectedJobId && selectedScheduleId && accessToken && candidateId) {
    const applicationUrl = `https://hiring.amazon.${urlIndex}/application/?page=pre-consent&jobId=${selectedJobId}&CS=true&token=${accessToken}&locale=${apilocale}&scheduleId=${selectedScheduleId}&ssoEnabled=1&candidateId=${candidateId}`;
    console.log("Opening URL:", applicationUrl);

    // Open the application URL in a new tab
    chrome.tabs.create({ url: applicationUrl }, (tab) => {
      // Once the tab is created, let's query the application API to get the applicationId
      queryApplicationId(candidateId, selectedJobId, selectedScheduleId);
    });
  } else {
    console.error("Missing required values to construct the URL");
  }
}



async function queryApplicationId(candidateId, jobId, scheduleId) {
  const accessToken = await getAccessToken(); // Ensure you have the accessToken

  // API request to get applicationId
  const response = await fetch(`https://hiring.amazon.${urlIndex}/application/api/candidate-application/ds/create-application/`, {
    headers: {
      "accept": "application/json, text/plain, */*",
      "accept-language": "en-US,en;q=0.9",
      "authorization": accessToken,
      "content-type": "application/json;charset=UTF-8",
      "priority": "u=1, i",
      "sec-ch-ua": "\"Google Chrome\";v=\"131\", \"Chromium\";v=\"131\", \"Not_A Brand\";v=\"24\"",
      "sec-ch-ua-mobile": "?0",
      "sec-ch-ua-platform": "\"macOS\"",
      "sec-fetch-dest": "empty",
      "sec-fetch-mode": "cors",
      "sec-fetch-site": "same-origin"
    },
    referrer: `https://hiring.amazon.${urlIndex}/application/${countryCode}/?CS=true&jobId=${jobId}&locale=${apilocale}&scheduleId=${scheduleId}&ssoEnabled=1`,
    referrerPolicy: "strict-origin-when-cross-origin",
    body: JSON.stringify({
      jobId: jobId,
      dspEnabled: true,
      scheduleId: scheduleId,
      candidateId: candidateId,
      activeApplicationCheckEnabled: true
    }),
    method: "POST",
    mode: "cors",
    credentials: "include"
  });

  const data = await response.json();

  if (data && data.data && data.data.applicationId) {
    const applicationId = data.data.applicationId; // Retrieve the applicationId
    console.log("Application ID:", applicationId);

    // Make the additional fetch request for schedule details
    const scheduleDetailsResponse = await fetch(`https://hiring.amazon.${urlIndex}/application/api/job/get-schedule-details/${scheduleId}?locale=${apilocale}`, {
      headers: {
        "accept": "application/json, text/plain, */*",
        "accept-language": "en-US,en;q=0.9",
        "authorization": accessToken,
        "bb-ui-version": "bb-ui-v2",
        "cache-control": "no-cache",
        "priority": "u=1, i",
        "sec-ch-ua": "\"Google Chrome\";v=\"131\", \"Chromium\";v=\"131\", \"Not_A Brand\";v=\"24\"",
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": "\"macOS\"",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin"
      },
      referrer: `https://hiring.amazon.${urlIndex}/application/${countryCode}/?CS=true&jobId=${jobId}&locale=${apilocale}&scheduleId=${scheduleId}&ssoEnabled=1`,
      referrerPolicy: "strict-origin-when-cross-origin",
      method: "GET",
      mode: "cors",
      credentials: "include"
    });

    const  scheduleDetailsResponseData = await scheduleDetailsResponse.json();

    if (scheduleDetailsResponseData) {
      const scheduleDetails = scheduleDetailsResponseData.data;
      let scheduleDetailsJsonString = JSON.stringify(scheduleDetails).replace(/\\/g, '\\\\') // Escape backslashes
      .replace(/"/g, '\\"')   // Escape double quotes
      .replace(/\n/g, '');    // Remove line breaks if needed;

      console.log("Schedule details:", scheduleDetailsJsonString);

      // Call the update application API with schedule details
      const updateResponse = await fetch(`https://hiring.amazon.${urlIndex}/application/api/candidate-application/update-application`, {
        headers: {
          "accept": "application/json, text/plain, */*",
          "accept-language": "en-US,en;q=0.9",
          "authorization": accessToken,
          "bb-ui-version": "bb-ui-v2",
          "content-type": "application/json;charset=UTF-8",
          "priority": "u=1, i",
          "sec-ch-ua": "\"Google Chrome\";v=\"131\", \"Chromium\";v=\"131\", \"Not_A Brand\";v=\"24\"",
          "sec-ch-ua-mobile": "?0",
          "sec-ch-ua-platform": "\"macOS\"",
          "sec-fetch-dest": "empty",
          "sec-fetch-mode": "cors",
          "sec-fetch-site": "same-origin"
        },
        referrer: `https://hiring.amazon.${urlIndex}/application/${countryCode}/?CS=true&jobId=${jobId}&locale=${apilocale}&scheduleId=${scheduleId}&ssoEnabled=1`,
        referrerPolicy: "strict-origin-when-cross-origin",
        body: JSON.stringify({
          applicationId: applicationId,
          dspEnabled: true,
          isCsRequest: true,
          payload: {
            jobId: jobId,
            scheduleId: scheduleId,
            scheduleDetails: scheduleDetailsJsonString,
          },
          type: "job-confirm"

        }),
        method: "PUT",
        mode: "cors",
        credentials: "include"
      });

      const updateData = await updateResponse.json();

      if (updateData && updateData.success) {
        console.log("Application updated successfully");

        // Construct the final URL with applicationId
        const finalUrl = `https://hiring.amazon.${urlIndex}/application/${countryCode}/?CS=true&jobId=${jobId}&locale=${apilocale}&scheduleId=${scheduleId}&ssoEnabled=1#/general-questions?CS=true&jobId=${jobId}&locale=${apilocale}&scheduleId=${scheduleId}&ssoEnabled=1&applicationId=${applicationId}`;
        console.log("Opening application URL:", finalUrl);

        // Open the final application URL in a new tab
        chrome.tabs.create({ url: finalUrl });
      } else {
        console.error("Failed to update application.");
      }
    } else {
      console.error("Failed to retrieve schedule details.");
    }
  } else {
    console.error("Failed to retrieve applicationId.");
  }
}

function getSessionToken() {
  return new Promise((resolve) => {
    chrome.storage.local.get("sessionToken", (result) => {
      resolve(result.sessionToken || "");
    });
  });
}

function getAccessToken() {
  return new Promise((resolve) => {
    chrome.storage.local.get("accessToken", (result) => {
      resolve(result.accessToken || "");
    });
  });
}

