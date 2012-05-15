import QtQuick 1.0
import "tools/string.js" as StringTools
import "tools/component.js" as ComponentTools
import com.mind6.engine 1.0 as Engine
FocusScope {
    id: root
    anchors.fill: parent
    Rectangle { color: "black"; anchors.fill: parent; }
    property string defaultPage;
    property variant currentPage;
    property string pagesDirectory : "../pages/";
    Engine.Controller {
        id: controller
        onPageChangeRequest: root.goTo(pageName);
    }
    function goTo(pageName, properties)
    {
        if(pageName !== "")
        {
            var fileName = StringTools.trim(pageName) + ".qml";
            var obj = ComponentTools.createQmlObjectFromFile(root.pagesDirectory + fileName, { "name" : pageName, "properties" : properties || { } }, root);
            if(root.currentPage)
                root.currentPage.destroy();
            root.currentPage = obj;
        }
    }
    Component.onCompleted: {
        goTo(root.defaultPage);
    }
}
