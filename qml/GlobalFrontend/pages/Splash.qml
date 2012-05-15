import QtQuick 1.0
import "../components" as GenericComponents
import com.mind6.effects 1.0 as Effects
Page {
    id: root
    showHeader: false; showFooter: false;
    Image {
        id: logo
        source: "img/mind6-logo-white.png";
        anchors.centerIn: parent;
        effect: blurEffect
        Effects.Blur {
            id: blurEffect
            blurRadius:  0

        }
    }
    Timer {
        interval: 1500;
        running: true;
        onTriggered: root.state = "exit";
    }
    states: [
        State {
            name: "exit"
            PropertyChanges {
                target: logo
                opacity: 0.0
            }
            PropertyChanges {
                target: blurEffect
                blurRadius: 400
            }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "exit"
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation { target: logo; properties: "opacity"; duration: 500; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: blurEffect; property: "blurRadius"; duration: 250; easing.type: Easing.InOutQuad }
                }
                PauseAnimation { duration: 1000; }
                ScriptAction { script: goTo("Home"); }
            }
        }
    ]
}
