// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: root
    property variant dateObject;
    property string hours           : (parseInt(root.hoursMilitary) === 0) ? "00" : root.hoursMilitary%12; // Returns the hour (from 0-23)
    property string minutes         : (parseInt(root.dateObject.getMinutes()) < 10) ? "0" + root.dateObject.getMinutes() : root.dateObject.getMinutes(); // Returns the minutes (from 0-59)
    property string seconds         : (parseInt(root.dateObject.getSeconds()) < 10) ? "0" + root.dateObject.getSeconds() : root.dateObject.getSeconds(); // Returns the seconds (from 0-59)
    property variant hoursMilitary  : root.dateObject.getHours(); // Returns the hour (from 0-23)
    property string ampm            : (root.hoursMilitary >= 12) ? "PM" : "AM";
    property variant date           : root.dateObject.getDate(); // Returns the day of the month (from 1-31)
    property variant day            : root.dateObject.getDay(); // Returns the day of the week (from 0-6)
    property variant year           : root.dateObject.getFullYear(); // Returns the year (four digits)
    property variant month          : root.dateObject.getMonth(); // Returns the month (from 0-11)
    property string localeString    : root.dateObject.toLocaleString();
    property string dateString      : root.dateObject.toDateString();
    Timer {
        id: updateTime
        running: false; repeat: true; interval: 1000; // worst case accuracy. could be 999 milliseconds off.
        onTriggered: root.dateObject = new Date();
    }
    Component.onCompleted: {
        root.dateObject = new Date();
        updateTime.start();
    }
}
