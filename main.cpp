#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QGLWidget>
#include <QDeclarativeEngine>
#include <QDeclarativeContext>
#include <QNetworkAccessManager>
#include <QNetworkDiskCache>
#include <QDebug>
#include <QtDeclarative>
#include <QMouseEvent>
#include <QDeclarativeItem>
#include "controller.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    qmlRegisterType<QGraphicsBlurEffect>("com.mind6.effects",1,0,"Blur");
    qmlRegisterType<QGraphicsColorizeEffect>("com.mind6.effects",1,0,"Colorize");
    qmlRegisterType<QGraphicsDropShadowEffect>("com.mind6.effects",1,0,"DropShadow");
    qmlRegisterType<QGraphicsOpacityEffect>("com.mind6.effects",1,0,"OpacityEffect");

    qmlRegisterType<Controller>("com.mind6.engine",1,0,"Controller");


    QmlApplicationViewer viewer;
    QGLFormat _format = QGLFormat::defaultFormat();
    _format.setSwapInterval(1);
    viewer.setViewport(new QGLWidget(_format));
    viewer.setViewportUpdateMode(QGraphicsView::FullViewportUpdate);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setOptimizationFlags(QGraphicsView::DontSavePainterState);
    viewer.setAttribute(Qt::WA_OpaquePaintEvent);
    viewer.setAttribute(Qt::WA_NoSystemBackground);
    viewer.setMainQmlFile(QLatin1String("qml/GlobalFrontend/main.qml"));
    viewer.showFullScreen();

    return app->exec();
}
