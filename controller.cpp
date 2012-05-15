#include "controller.h"

Controller::Controller(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{

}

void Controller::goToPage(QString pageName)
{
    emit pageChangeRequest(pageName);
}
