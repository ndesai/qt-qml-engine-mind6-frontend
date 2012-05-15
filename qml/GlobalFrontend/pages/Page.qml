// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../engine/tools/page.js" as PageTools

FocusScope {
    id: root
    anchors.fill: parent
    property string name : ""
    property variant properties;
    property bool showHeader : true;
    property bool showFooter : true;
    function getProperty(v) { return PageTools.getParams(root.properties, v); }
    z: 98;
}
