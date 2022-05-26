import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
Item {   

    Rectangle{
        width:1
        height:parent.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        color:"grey"
    }
    Rectangle{
        id:horizontalLien
        height: 1
        width:parent.width
        color:"grey"
        y:parent.height*0.35

    }

    Text {
        id: textFriends
        text: "friends"
        font.pixelSize: parent.height*0.05
        color:"white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: horizontalLien.bottom
        anchors.topMargin: parent.height*0.05*0.4
    }
    Image {
        id:addImage
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/addFriend.png"
        anchors.right: parent.right
        anchors.leftMargin: addImage.height
        anchors.top:textFriends.top
        anchors.bottom:textFriends.bottom
        ColorOverlay {
            id:colorOverlayAddFriend
            anchors.fill: parent
            color: "#92F5EF09"
            source: parent
            visible: false
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {colorOverlayAddFriend.visible=true}
            onExited: { colorOverlayAddFriend.visible=false}
            onClicked: {popup.visible=true}
        }


    }

    ListView{
        id:allFriends
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: textFriends.bottom
        anchors.margins: 20
        model: fruitModel
        spacing:10
        delegate: fruitDelegate
        clip:true
    }
    ListModel {
        id: fruitModel

        ListElement {
            fileName:"qrc:/images/avatarPhoto.png"
            nameFriend:"иван иванович"
        }
        ListElement {
            fileName:"qrc:/images/avatarPhoto.png"
            nameFriend:"денис денис"
        }
        ListElement {
            fileName:"qrc:/images/avatarPhoto.png"
            nameFriend:"name surname"
        }
    }
    Component {
        id: fruitDelegate

        Row{
            Image{
                id:imageFriend
                width: mianPageItem.width*0.05
                fillMode: Image.PreserveAspectFit
                source: fileName
            }
            Text {
                font.pixelSize: mianPageItem.width*0.033
                text: nameFriend
                color:"white"
                anchors.verticalCenter: imageFriend.verticalCenter
            }
        }

    }

    Item{
        width:parent.width
        height:parent.height*0.35
        Image{
            anchors.fill: parent
            source: "qrc:/images/avatarPhoto.png"
            fillMode: Image.PreserveAspectFit
            anchors.bottomMargin: 5
        }

    }
    Popup {
          id: popup
          x: 100
          y: 100
          width: 200
          height: 300
          focus: true
          modal:true
    visible: false
    closePolicy: Popup.CloseOnPressOutside

          padding: 0
          Column{
             id:columnPopup
              anchors.top: parent.top
              width:parent.width
              Text {
                  id: name
                  text: "add friend"
                  color:"black"
                  font.pixelSize: 20
                  anchors.horizontalCenter:columnPopup.horizontalCenter

              }
          Rectangle{
    width:popup.width
    height:2

    color:"grey"
          }
          Item{
              width:popup.width
              height:20

              Text {
                  anchors.left: parent.left
                  anchors.leftMargin: 5
                  id: titlePopup
                  text: "id:"
                  color:"black"
                  font.pixelSize: 15

              }
          }

          Item{
              width:popup.width
              height:20

              TextInput{
                  id:titlePostPopup
                  anchors.left: parent.left
                  anchors.leftMargin: 5
                  maximumLength: 16
                  font.pixelSize: 12
                  focus: true
                  anchors.margins: 5
              }
          }

          Rectangle{
    width:popup.width-5
    height:1
    anchors.horizontalCenter:columnPopup.horizontalCenter

    color:"grey"
          }
          Button{
              width:100
              height:30
              text:"search"
              font.pixelSize: 15
              anchors.horizontalCenter: columnPopup.horizontalCenter
              onClicked: {popup.close(); fruitModel.append({"fileName":"qrc:/images/avatarPhoto.png","nameFriend":"vasya"})}
          }
      }

    }
}
