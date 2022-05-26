import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
Item {
    property int heightButton

    Rectangle{
        id:rect2
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.margins:10
        width:parent.width/3.5
        color:MyStyle.mainBackgroundColor
        border.color:MyStyle.mainBackgroundBorderColor
        radius:  MyStyle.mainBackgroundRadius
        MyButtonStartPageLoginRegister{
             id:login
             textButton:"login"
             anchors.top: parent.top
             anchors.left: parent.left
             anchors.right: parent.right
             anchors.leftMargin:  parent.width*0.1
             anchors.rightMargin: parent.width*0.1
             anchors.topMargin: parent.height*0.05
             height:parent.height*0.08


           }
         MyButtonStartPageLoginRegister{
             id:register
             textButton:"register"
             anchors.left: parent.left
             anchors.right: parent.right
             anchors.leftMargin:  parent.width*0.1
             anchors.rightMargin: parent.width*0.1
             anchors.top: login.bottom
             anchors.topMargin: height*0.5
             height:parent.height*0.08

          }
         Image {
             id: name
             source: "qrc:/images/logo.png"
             anchors.bottom: parent.bottom
             width:Math.min(parent.height,parent.width)*0.9
             fillMode: Image.PreserveAspectFit
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.bottomMargin: parent.height*0.05

         }
        }

    Rectangle{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: rect2.right
        anchors.margins:10
        color:MyStyle.mainBackgroundColor
        border.color:MyStyle.mainBackgroundBorderColor
        radius:  MyStyle.mainBackgroundRadius
        Text {
            id: nameInfo
            text: MyStyle.mainBackgroundTextInfo
            anchors.centerIn: parent
            color:"white"
            font.pixelSize:Math.min(parent.height,parent.width)*0.07

        }
    }
}
