import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
import Qt5Compat.GraphicalEffects

Item {
    width: parent.width
    height:parent.height/10
    Rectangle{
        anchors.fill: parent
        anchors.topMargin: MyStyle.mainMargin
        anchors.leftMargin: MyStyle.mainMargin
        anchors.rightMargin: MyStyle.mainMargin
        color:MyStyle.mainBackgroundColor
        border.color:MyStyle.mainBackgroundBorderColor
        radius: MyStyle.mainBackgroundRadius
        id:rect
        Text{
            anchors.centerIn: parent
            text:"Title"
            font.pixelSize: parent.height*0.8
            id:textTitle
            color:MyStyle.mainTitleColorNotHover
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered:  {textTitle.font.pixelSize=textTitle.font.pixelSize+rect.height*0.05;textTitle.color=MyStyle.mainTitleColorHover}
            onExited: {textTitle.font.pixelSize=textTitle.font.pixelSize-rect.height*0.05;textTitle.color=MyStyle.mainTitleColorNotHover}
            onPressed: {textTitle.color=MyStyle.mainTitleColorHover}
            onClicked: mainStackView.push("qrc:/MyContentItem.qml")
        }
        Image {
            id: nameQuestionImage
            source: "qrc:/images/question.png"
            anchors.right: parent.right
            anchors.rightMargin: parent.width/100
            height: parent.height*0.9
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: imageQuestionAnswer.visible=true
                onExited:  imageQuestionAnswer.visible=false

            }
        }

            Image {
                id: imageQuestionAnswer
                source: "qrc:/images/questionLogo.png"
                anchors.right: nameQuestionImage.left
                anchors.top: nameQuestionImage.bottom
                visible: false
                width:parent.width/6
                height:width
                fillMode: Image.PreserveAspectFit
            }
            DropShadow {
                   anchors.fill: imageQuestionAnswer
                   horizontalOffset: imageQuestionAnswer.width*0.03
                   verticalOffset:  imageQuestionAnswer.height*0.03
                   radius: 1.0
                   color: "black"
                   source: imageQuestionAnswer
                   visible: imageQuestionAnswer.visible
               }

    }

}
