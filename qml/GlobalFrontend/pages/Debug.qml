// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../components" as Components

Page {
    id: root
    property string sender : ""
    Rectangle {
        anchors.fill: parent
        color: "gray"

        Column {
            anchors.centerIn: parent
            width: childrenRect.width; height: childrenRect.height
            Text {
                color: "white"
                text: "Sender: " + getProperty("sender");
            }
        }
    }
}
