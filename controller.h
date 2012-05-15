#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QDeclarativeItem>

class Controller : public QDeclarativeItem
{
    Q_OBJECT
public:
    explicit Controller(QDeclarativeItem *parent = 0);
    Q_INVOKABLE void goToPage(QString pageName);
signals:
    void pageChangeRequest(QString pageName);
    
public slots:
    
};

#endif // CONTROLLER_H
