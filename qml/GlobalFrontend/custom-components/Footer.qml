import QtQuick 1.0
import "../components" as Components
Rectangle {
    id: root
    property bool show : false;
    width: parent.width
    height: 80
    anchors.bottom: parent.bottom
    anchors.bottomMargin: -80
    z: 99
    color: "#111111"

    Text {
        id: clock
        color: "white"
        anchors.left: parent.left;
        anchors.leftMargin: 35;
        anchors.top: parent.top
        anchors.topMargin: 27;
        font.family: "Gotham Thin"
        font.pixelSize: 32
        width: paintedWidth + 10
        clip: false;
        horizontalAlignment: Text.AlignHCenter
        text: datetime.hours + ":" + datetime.minutes + ":" + datetime.seconds + " ";
        smooth: true;
    }
    Text {
        id: ampm
        anchors.left: clock.right
        anchors.top: parent.top
        anchors.topMargin: 27;
        width: paintedWidth + 10
        text: datetime.ampm
        color: "white"
        font.family: "Gotham Thin"
        font.pixelSize: 32;
        smooth: true;
    }

    Components.DateTime {
        id: datetime
    }


    states: [
        State {
            name: "show"
            when: root.show
            PropertyChanges {
                target: root
                anchors.bottomMargin: 0;
            }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "show"
            NumberAnimation { target: root; duration: 350; property: "anchors.bottomMargin"; easing.type: Easing.OutBack; easing.overshoot: 0.65; }
        },
        Transition {
            from: "show"
            to: ""
            NumberAnimation { target: root; duration: 350; property: "anchors.bottomMargin"; easing.type: Easing.OutBack; easing.overshoot: 0.65; }
        }
    ]
}
