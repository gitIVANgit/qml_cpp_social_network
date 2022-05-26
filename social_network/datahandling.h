#ifndef DATAHANDLING_H
#define DATAHANDLING_H

#include <QObject>
#include <QtSql>
#include <QSqlDatabase>

class DataHandling : public QObject
{
    Q_OBJECT
public:
    explicit DataHandling(QObject *parent = nullptr);
bool connectToDataBase();
signals:
void loggedOrNot(bool yesNot);
void expandModel(QString titlep,QString mainp,QString idOfPost);
void updateIdOfPost(QString updateIdForPost);
public slots:
    void addRegister(QString login,QString password);
    void logging(QString login,QString password);
    void addPost(QString title,QString main);
    void deletePost(QString postId);

};

#endif // DATAHANDLING_H
