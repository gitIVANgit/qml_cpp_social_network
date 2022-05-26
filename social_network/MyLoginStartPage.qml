import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
Item {
    property bool flag:false
    Connections{
        target:slot
        onLoggedOrNot:{
           flag = yesNot;
            if(flag){
                mainStackView.push("qrc:/MyMainProfilePage.qml")
                correctOrNot.visible=false

            }else{
correctOrNot.visible=true
            }
        }
    }

    Rectangle{
        anchors.fill: parent
        color:"black"
        id:rootRectLogin
       Column{
           id:column
           spacing: parent.height/35
           anchors.centerIn: parent
          Row{
              spacing:rootRectLogin.width/30
           Rectangle {
               id:login
               width:rootRectLogin.width/5
               height:rootRectLogin.height/10
               color:MyStyle.mainButtonColorBackground
               border.color:MyStyle.mainButtonColorBorder
               border.width: MyStyle.mainButtonBorderWidth
               radius: MyStyle.mainButtonRadius
               Text {
                   anchors.centerIn: parent
                   text: "login"
                   font.pixelSize: parent.height*0.5
                   color:"red"
               }
               MouseArea{
                   anchors.fill: parent
                   hoverEnabled: true
                   onEntered: {parent.color=MyStyle.mainButtonColorBackgroundHovered}
                   onExited: {  parent.color=MyStyle.mainButtonColorBackground}

               }
           }
           Rectangle{
               width:login.width*2
               height:login.height
               color:"transparent"
               border.color: "green"
               radius: 10
               TextInput {
                          id: input
                          color: "white"
                          font.pixelSize: height*0.8
                          font.bold: true
                          maximumLength: 16
                          verticalAlignment: Text.AlignVCenter
                          width:parent.width
                          height:parent.height
                          clip:true
                          focus:true
                          padding: height*0.1
                          selectByMouse: true
                          selectionColor: "yellow"

                      }
           }



       }
          Row{
              spacing:rootRectLogin.width/30
           Rectangle {

               width:rootRectLogin.width/5
               height:rootRectLogin.height/10
               color:MyStyle.mainButtonColorBackground
               border.color:MyStyle.mainButtonColorBorder
               border.width: MyStyle.mainButtonBorderWidth
               radius: MyStyle.mainButtonRadius
               Text {
                   anchors.centerIn: parent
                   text: "password"
                   font.pixelSize: parent.height*0.5
                   color:"red"
               }
               MouseArea{
                   anchors.fill: parent
                   hoverEnabled: true
                   onEntered: {parent.color=MyStyle.mainButtonColorBackgroundHovered}
                   onExited: {  parent.color=MyStyle.mainButtonColorBackground}

               }
           }

               Rectangle{
               width:login.width*2
               height:login.height
               color:"transparent"
               border.color: "green"
               radius: 10
               TextInput {
                          id: input2
                          color: "white"
                          font.pixelSize: height*0.8
                          font.bold: true
                          maximumLength: 16
                          verticalAlignment: Text.AlignVCenter
                          width:parent.width
                          height:parent.height
                          clip:true
                          focus:true
                          padding: height*0.1
                          selectByMouse: true
                          selectionColor: "yellow"
                          echoMode: TextInput.Password
                      }
                  }
         }
          MySubmitButton {
              id: submitButton
              width:column.width
              height:rootRectLogin.height/10
              textButtonSubmit: "submit"
              MouseArea{
                  anchors.fill: parent
                  hoverEnabled: true
                  onEntered: {parent.color=Qt.darker(MyStyle.mainSubmitButtonColorBackground,1.2)}
                  onExited: {  parent.color=MyStyle.mainSubmitButtonColorBackground}
                  onClicked: {
                      slot.logging(input.text,input2.text)
                      correctOrNot.visible=true

                  }}
          }
          Text{
              id:correctOrNot
              text:"not correct!";
              color:"white"
              font.pixelSize: input2.font.pixelSize*0.6
              visible: false
          }

       }

    }

}

