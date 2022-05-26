#include "datahandling.h"
#include <QDebug>
//#include <QMessageBox>
#include <QVariant>
QString id;

QSqlDatabase db=QSqlDatabase::addDatabase("QPSQL");
QString idPerson;

DataHandling::DataHandling(QObject *parent)
    : QObject{parent}
{

}

bool DataHandling::connectToDataBase()
{
    db.setDatabaseName("postgres");
    db.setUserName("postgres");
    db.setPassword("1234");

    if(!db.open()){

        qDebug()<<"not opented";

        return false;
    }

    return true;
}

void DataHandling::addRegister(QString password, QString login){
    bool a=connectToDataBase();
    if(a){
        qDebug()<<login<<" "<<password;

        QSqlQuery query;
        query.exec("create table if not exists persone(id serial primary key, password varchar(256), login varchar(256))");

        QSqlQuery query2;
        query2.exec("insert into persone(password,login)values('"+password+"','"+login+"')");
    }
    db.close();
}

void DataHandling::logging(QString login, QString password)
{
    bool a=connectToDataBase();

    QString loginFromDB;
    QString passFromDB;
    QString main;
    QString title;

   // bool logged=false;

    if(a){

        qDebug()<<login<<" "<<password;

        QSqlQuery query;

        if(query.exec("select login, password,id FROM persone WHERE login ='"+login+"' and password ='"+password+"'")){

            query.first();

            loginFromDB=query.value(0).toString();
            passFromDB=query.value(1).toString();
            idPerson=query.value(2).toString();

          //  qDebug()<<"login= "<<loginFromDB<<" "<<"pass= "<<passFromDB;

            if(login==loginFromDB&&password==passFromDB&&login!=""&&password!=""){

             //   qDebug()<<"right";
                emit loggedOrNot(true);

                QSqlQuery query2;
                query2.exec("create table if not exists posts(id serial primary key, id_persone integer, title varchar(30), main varchar(256))");


                QSqlQuery query3;
                query3.exec("select * from posts where id_persone='"+idPerson+"'");
                int mainid = query3.record().indexOf("main");
                int titleid = query3.record().indexOf("title");
                int idid = query3.record().indexOf("id");

                while(query3.next()){
                main=query3.value(mainid).toString();
                title=query3.value(titleid).toString();
                id=query3.value(idid).toString();

                //qDebug()<<id;
              emit expandModel(title,main,id);
                }
                db.close();
                return;

            }else{

               // qDebug()<<"not right";
                db.close();

                return;
            }
        }
    }
}

void DataHandling::addPost(QString title, QString main)
{
    QString lastId;

bool a=connectToDataBase();
if(a){
//qDebug()<<title<<" "<<main;
QSqlQuery query2;
query2.exec("insert into posts(id_persone,title,main)values('"+idPerson+"','"+title+"','"+main+"')");
lastId=query2.lastInsertId().toString();



emit updateIdOfPost(lastId);
db.close();

}}

void DataHandling::deletePost(QString postId)
{
    bool a=connectToDataBase();

if(a){qDebug()<<"delete id of post in database = "<<postId;

QSqlQuery query2;
query2.exec("delete from posts where id='"+postId+"'");
}}
