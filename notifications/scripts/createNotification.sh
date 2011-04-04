#!/bin/bash

JSON='
{
    "id":"12345",
    "sendDate":"2011-11-16T12:16:59-01:00",
    "dynamicListID":"/a/path/to/a/dynamic/list",
    "calendarWrapper":{
        "uri":"/a/path/to/bedework/url",
        "etag":"2011-03-16T12:16:59-07:00",
        "component":"VEVENT",
        "isRequired":true,
        "isArchived":false,
        "isCompleted":false,
        "icalData":{
            "DTSTAMP":"2011-03-31T15:15:06-07:00",
            "DTSTART":"2011-04-11T15:15:06-07:00",
            "SUMMARY":"a test event",
            "UID":"e86bd618-bdc4-4881-8407-158e4bba7570",
            "CATEGORIES":["MyBerkeley-Required","MyBerkeley-Archived"],
            "DESCRIPTION":"this is the description, it is long enough to wrap at the ical specified standard 75th column"
        }
    }
}
'

# strip newlines
JSON=`echo "${JSON}" | tr -d '\n'`

curl -u 904715:testuser "http://localhost:8080/~904715.myb-notificationstore.html" -F notification="$JSON"

