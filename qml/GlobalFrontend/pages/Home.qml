import QtQuick 1.0
import "../components" as GenericComponents

Page {
    id: root
    Rectangle {
        id: rect
        color: "yellow"
        width: 200; height: 200
        anchors.centerIn: parent
        opacity: 0
        GenericComponents.MouseArea {
            onClicked: goTo("Debug", { "sender" : "Niraj" });
        }
    }
    states: [
        State {
            name: "visible"
            PropertyChanges {
                target: rect
                opacity: 1.0
            }
        }

    ]
    transitions: [
        Transition {
            from: ""
            to: "visible"
            SequentialAnimation {
                PauseAnimation { duration: 250; }
                NumberAnimation { target: rect; property: "opacity"; duration: 350; easing.type: Easing.InOutQuad }
            }
        }
    ]
    Component.onCompleted: {
        root.state = "visible"
    }
}
