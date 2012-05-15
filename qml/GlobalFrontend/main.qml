import QtQuick 1.1
import "engine" as Engine
import "pages" as Pages
import "custom-components" as CustomComponents

Engine.Main {
    id: root
    defaultPage: "Splash"
    CustomComponents.Header {
        show: currentPage.showHeader
    }
    CustomComponents.Footer {
        show: currentPage.showFooter
    }
}
