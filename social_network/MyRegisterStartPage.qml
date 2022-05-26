import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
Item {
    property int spacingRow:scroll.width*0.05
    ScrollView {
        id:scroll
        anchors.fill: parent
        clip: true
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical:
            ScrollBar {
                id: vbar
                z: 100
                anchors.top: scroll.top
                anchors.right: scroll.right
                anchors.bottom: scroll.bottom
                active: true
                contentItem: Rectangle {
                    id:contentItem_rect2
                    radius: vbar.width/2
                    color: "light blue"

                }
                width: 10
            }


Column{
anchors.fill: parent
anchors.topMargin:  10
    anchors.bottomMargin: 10
    anchors.leftMargin: 10
    anchors.rightMargin: 10
    spacing: scroll.height*0.07
   Row{
spacing: spacingRow
   Rectangle{
       id:imageLoad
   width:scroll.width*0.1
   height:width
   radius:width/2
   clip: true
   color:MyStyle.mainBackgroundColor
   border.color: MyStyle.mainButtonColorBackground
   Image {
       id: name
       source: "qrc:/images/loadImage.png"
       fillMode: Image.PreserveAspectFit
       width:parent.width/2
anchors.centerIn: parent
   }
   }

Text{
text:"Profile photo load"
font.pixelSize: imageLoad.height*0.5
color: MyStyle.mainButtonColorBackground
anchors.verticalCenter: imageLoad.verticalCenter
}
   }
   Row{
       spacing: spacingRow

       Rectangle{
           id:nameToRegister
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
                  id: input3
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
       Text{
           id:p
       text:"Name"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
       anchors.verticalCenter: nameToRegister.verticalCenter
       }


   }

   Row{
       spacing: spacingRow

       Rectangle{
           id:surnameToRegister
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
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
       Text{
       text:"Surname"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
       anchors.verticalCenter: surnameToRegister.verticalCenter
       }


   }
   Row{
       spacing: spacingRow

       Rectangle{
           id:ageToRegister
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
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
                  validator: IntValidator {bottom: 1; top: 100}

              }
          }
       Text{
       text:"Age(at least 18)"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
       anchors.verticalCenter: ageToRegister.verticalCenter
       }


   }
   Row{
       spacing: spacingRow

       Rectangle{
           id:cityToRegister
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
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
       Text{
       text:"City"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
       anchors.verticalCenter: ageToRegister.verticalCenter
       }


   }
   Row{
       spacing: spacingRow

       ComboBox{
           id:status
           width:scroll.width*0.2
           height:width/3
           model:statusModel
font.pixelSize: height*0.4
       }
       Text{
       text:"Status"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
       anchors.verticalCenter: status.verticalCenter
       }
   }
   Row{
       spacing: spacingRow

       ComboBox{
           id:education
           width:scroll.width*0.2
           height:width/3
           model:educationModel
font.pixelSize: height*0.4
       }
       Text{
       text:"Education"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
        }
   }
   Row{
       spacing: spacingRow

       Rectangle{
           id:aboutYou
       width:scroll.width*0.2
       height:width/1.8
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
                  color: "white"
                  font.pixelSize: height*0.2
                  font.bold: true
                  maximumLength: 60
                  verticalAlignment: Text.AlignVCenter
                  width:parent.width
                  height:parent.height
                  clip:true
                  focus:true
                  padding: height*0.1
                  selectByMouse: true
                  selectionColor: "yellow"
wrapMode: Text.Wrap
              }
          }
       Text{
       text:"About you"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
        }
   }

   Row{
       spacing: spacingRow

       Rectangle{
           id:pass1
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
           id:passwordregister
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
                //  echoMode: TextInput.Password
              }
          }
       Text{
       text:"Pass "
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
        }
   }
   Row{
       spacing: spacingRow

       Rectangle{
           id:pass2
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
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
                 // echoMode: TextInput.Password

              }
          }
       Text{
       text:"Pass again"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
        }
   }
   Row{
       spacing: spacingRow

       Rectangle{
           id:loginEntry
       width:scroll.width*0.2
       height:width/4
       color:"transparent"
       border.color: "green"
       radius: 10
       TextInput {
           id:loginregister
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
       Text{
       text:"Login"
       font.pixelSize: imageLoad.height*0.5
       color: MyStyle.mainButtonColorBackground
        }
   }
   MySubmitButton{
       width:parent.width
       height:loginEntry.height
      textButtonSubmit:"register"
      MouseArea{
          anchors.fill: parent
          hoverEnabled: true
          onEntered: {parent.color=Qt.darker(MyStyle.mainSubmitButtonColorBackground,1.2)}
          onExited: {  parent.color=MyStyle.mainSubmitButtonColorBackground}
          onClicked:{
              mainStackView.push("qrc:/MyLoginStartPage.qml")

slot.addRegister(passwordregister.text,loginregister.text);


          }

  }
   }

   Item{
       width:100
       height:30
   }
}


    }
    ListModel{
        id:statusModel
        ListElement{
            name:"single"

        }
        ListElement{
            name:"married"

        }        ListElement{
            name:"engaged"

        }
        ListElement{
                   name:"other"
                 }
    }
    ListModel{
        id:educationModel
        ListElement{
            name:"primary"

        }
        ListElement{
            name:"secondary"

        }        ListElement{
            name:"Post-secondary"

        }
        ListElement{
                   name:"Postgraduate"
                 }
    }
}
