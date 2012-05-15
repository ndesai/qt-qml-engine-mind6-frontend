function createQmlObjectFromFile(file, properties, parent) {
    var qmlComponent = Qt.createComponent(file)
    var componentObject = null
    if (qmlComponent.status === Component.Ready) {
        componentObject = qmlComponent.createObject(parent ? parent : root, properties ? properties : {})
    }
    else {
        console.log("ERROR: Component.js " + qmlComponent.errorString())
    }
    qmlComponent.destroy();
    return componentObject
}
