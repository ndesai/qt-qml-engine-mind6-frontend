import QtQuick 1.0

Rectangle {
    id: root
    property bool show : false;
    width: parent.width
    height: 80
    anchors.bottom: parent.bottom
    anchors.bottomMargin: -80
    z: 99
    color: "red"


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
