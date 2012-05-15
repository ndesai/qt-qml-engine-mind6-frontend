// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Page {
    id: root
    property string sender : ""
    Rectangle {
        anchors.fill: parent
        color: "blue"

        Text {
            anchors.centerIn: parent
            color: "white"
            text: "Sender: " + getProperty("sender");
        }
    }
}
