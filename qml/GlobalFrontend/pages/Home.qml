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
        smooth: true
        border { width: 5; color: "red" }
        radius: 4
        GenericComponents.MouseArea {
            onClicked: if(rect.state == "") rect.state = "flip"; else goTo("Debug", { "sender" : "Niraj" });
        }
        transform: Rotation { id: rotationTransform; axis { x: 1; y: 0; z: 0} origin.x: rect.width/2; origin.y: rect.height/2; }
        states: [
            State {
                name: "flip"
                PropertyChanges {
                    target: rotationTransform
                    angle: 180
                }
                PropertyChanges {
                    target: rect
                    width: 600
                    height: 400
                }
            }
        ]
        transitions: [
            Transition {
                from: ""
                to: "flip"
                SequentialAnimation {
                    NumberAnimation { target: rect; property: "scale"; duration: 350; to: 0.65; easing.type: Easing.OutBack;  }

                    ParallelAnimation {
                        NumberAnimation { target: rect; property: "scale"; duration: 400; to: 1.4; easing.type: Easing.OutBack;  }
                        NumberAnimation { target: rotationTransform; property: "angle"; duration: 400; easing.type: Easing.OutBack;  }
                        NumberAnimation { target: rect; properties: "width,height"; duration: 450; easing.type: Easing.OutBack; }
                    }
                }
            }
        ]
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
