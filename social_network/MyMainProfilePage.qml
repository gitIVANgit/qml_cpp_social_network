import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0


Item{

    property string titleFromSlot
    property string newId;
    property string mainFromSlot

    Connections{
        target:slot
        onExpandModel: {postModel.append({"titlePost":titlep,"mainText":mainp,"idPost":idOfPost});console.log("getting id = "+idOfPost)}
    onUpdateIdOfPost:newId=updateIdForPost
    }


    property int indexi;
    property bool activPost:false
    id:mianPageItem
    anchors.fill: parent
    anchors.margins: 10
        MyProfileLeftItem {
            id: leftItem
anchors.top: parent.top
anchors.left: parent.left
anchors.bottom: parent.bottom
            width:parent.width*0.35
        }
Item{

    id:scroll
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.left: leftItem.right
    clip: true

        Column{
            id:columnAbout
            spacing:10
            clip:true
          width:scroll.width
          height:2*rowHeight.height+columnAbout.spacing
          Row{
              id:rowHeight
              spacing:10
              Item {
width: 5
height:1
              }
              Rectangle{
                  anchors.verticalCenter: textHor1.verticalCenter
                  width:Math.min(scroll.width*0.01,scroll.height*0.01)
                  height:width
                  radius: width/2
                  color:"lightblue"
              }
              Text{
                  id:textHor1
            text:"name"
color:"white"
font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)
            }
              Text{
              text:"surname"
              color:"white"
              font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)

              }

     }


          Row{
              spacing:10

              Item {
width: 5
height:1
              }
              Rectangle{
                  anchors.verticalCenter: aboutMarin.verticalCenter
                  width:Math.min(scroll.width*0.01,scroll.height*0.01)
                  height:width
                  radius: width/2
                  color:"lightblue"
              }

              Text{
                  id:aboutMarin
                   text:"age"
                   color:"white"
                   font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)
            }
              Text{
                   text:"city"
                   color:"white"
                   font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)

              }

     }
          Row{
              spacing:10

              Item {
width: 5
height:1
              }
              Rectangle{
                  anchors.verticalCenter: textHor2.verticalCenter
                  width:Math.min(scroll.width*0.01,scroll.height*0.01)
                  height:width
                  radius: width/2
                  color:"lightblue"
              }
              Text{
                  id:textHor2
                   text:"status"
                   color:"white"
                   font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)
            }
              Text{
                   text:"education"
                   color:"white"
                   font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)

              }

     }

          Row{
              id:rowSpacing
              spacing:10
              Item {
width: 5
height:1
              }
              Rectangle{
                  anchors.verticalCenter: textWidth.verticalCenter
                  width:Math.min(scroll.width*0.01,scroll.height*0.01)
                  height:width
                  radius: width/2
                  color:"lightblue"
              }
              Text{
                  id:textWidth
                   text:"about: "
                   color:"white"
                   font.pixelSize:Math.min(scroll.width*0.05,scroll.height*0.05)
            }
              Text{
                   text:" i like swimming i like rollerblading i like go to school i like everything i like a lot of things i like a lot of things "
                   width: scroll.width-2*rowSpacing.spacing-aboutMarin.font.pixelSize-textWidth.width
                   color:"white"
                   font.pixelSize:Math.min(scroll.width*0.045,scroll.height*0.045)
                   wrapMode: Text.Wrap

              }

     }


        }
        Image{
            id:expandImagePng
            source: "qrc:/images/expandIcon.png"
            width:textWidth.width*0.15
fillMode: Image.PreserveAspectFit
anchors.top: columnAbout.bottom
anchors.topMargin: height/2
            anchors.horizontalCenter: columnAbout.horizontalCenter
            ColorOverlay {
                id:colorOverlayAddFriend
                anchors.fill: parent
                color: "lightblue"
                source: parent
                visible: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {columnAbout.clip=!columnAbout.clip;if(columnAbout.clip){columnAbout.height=2*rowHeight.height+columnAbout.spacing;expandImagePng.rotation+=180}else{columnAbout.height=3*columnAbout.spacing+3*rowHeight.height+rowSpacing.height;expandImagePng.rotation+=180}}
            }
        }
Row{
    id:rowPostTitle
    anchors.top: expandImagePng.bottom
    anchors.topMargin: expandImagePng.height
    width:parent.width
    Item{
        width:parent.width/2-postdTitle.width/2
        height:1

    }
    Text{
        id:postdTitle
        text:"Posts"
        color:"lightblue"
        font.pixelSize: 2*aboutMarin.font.pixelSize
    }
    Image {
    id:addFriend
    width:postdTitle.font.pixelSize*1.3
    fillMode: Image.PreserveAspectFit
    source: "qrc:/images/addFriend.png"
    anchors.verticalCenter:  postdTitle.verticalCenter

   ColorOverlay {
       id:addPostColorOverlay
       anchors.fill: parent
       color: "#92F5EF09"
       source: parent
       visible: false
   }
   MouseArea{
       anchors.fill: parent
       hoverEnabled: true
       onEntered: {addPostColorOverlay.visible=true}
       onExited: { addPostColorOverlay.visible=false}
       onClicked: {popup.visible=true}
   }}


   Image {
       id:deleteFriend
       width:postdTitle.font.pixelSize*0.7
       fillMode: Image.PreserveAspectFit
       source: "qrc:/images/delete.png"

       anchors.verticalCenter:  postdTitle.verticalCenter


      MouseArea{
          anchors.fill: parent
          hoverEnabled: true
          onEntered: {if(activPost){deletcoloverlay.visible=true}}
          onExited: {if(activPost){ deletcoloverlay.visible=false}}
          onClicked: {
              console.log("console id = "+postModel.get(indexi).idPost)
          slot.deletePost(postModel.get(indexi).idPost)
              postModel.remove(indexi)

          }
      }
      ColorOverlay {
          id:deletcoloverlay
          anchors.fill: parent
          color: "#92F5EF09"
          source: parent
          visible: false
      }

   }

}



ListView{
    clip:true
  id:postView
  spacing: parent.height*0.07
  anchors.left: parent.left
  anchors.leftMargin: 5
anchors.top:rowPostTitle.bottom
model:postModel
focus:false
delegate:Component{
    id:postDelegate
    Item{
        width:postView.width-5
        height:scroll.height*0.3
    Rectangle{
anchors.fill: parent
        id:mainPostRect
color:"transparent"
border.color: "grey"

        ScrollView{
            id:scrollPost
 clip:true

 contentHeight: forHeight.height+titleOfPost.height+5
            anchors.fill: parent
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical:
                ScrollBar {
                    id: vbar
                    z: 100
                    anchors.top: scrollPost.top
                    anchors.right: scrollPost.right
                    anchors.bottom: scrollPost.bottom
                    active: true
                    contentItem: Rectangle {
                        id:contentItem_rect2
                        radius: vbar.width/2
                        color: "light blue"

                    }
                    width: 10
                }
            Text{
                id:titleOfPost
                text:titlePost
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
                color:"white"
                font.pixelSize: 0.7*postdTitle.font.pixelSize
                MouseArea{
anchors.fill: parent
onClicked: {activPost= !activPost;indexi=index;postView.currentIndex = index}
                }
            }
            Text {
                id:forHeight
                text: mainText
                anchors.margins: 5
                anchors.left: parent.left
                anchors.top: titleOfPost.bottom
                color:"white"
                wrapMode: Text.Wrap
                width: parent.width-5
                MouseArea{
anchors.fill: parent
onClicked: {activPost= !activPost;indexi=index; postView.currentIndex = index}
                }

            }
        }}



    }
}

width:parent.width
anchors.bottom: parent.bottom
highlight: Rectangle{
    color:"grey"
}
}
ListModel{
    id:postModel
    ListElement{
        titlePost:"first"
        mainText:"i like swimming i like rollerblading i like go to school i like everything i like a lot of things i like a lot of thingsi like swimming i like rollerblading i like go to school i like everything i like a lot of things i like a lot of thingsi like swimming i like rollerblading i like go to school i like everything i like a lot of things i like a lot of thingsi like swimming i like rollerblading i like go to school i like everything i like a lot of things i like a lot of thingsi like swimming i like rollerblading i like go to school i like everything i like a lot of things i like a lot of things"
        idPost:"smth"

    }

}
}
Popup {
      id: popup
      x: 100
      y: 100
      width: 200
      height: 300
      focus: true
      modal: true
visible: false
closePolicy: Popup.CloseOnPressOutside

      padding: 0
      Column{
         id:columnPopup
          anchors.top: parent.top
          width:parent.width
          Text {
              id: name
              text: "add post"
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
              text: "title"
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
              activeFocusOnTab: true
              anchors.margins: 5
          }
      }



      Rectangle{
width:popup.width-5
height:1
anchors.horizontalCenter:columnPopup.horizontalCenter

color:"grey"
      }
      Item{
          width:popup.width
          height:20

          Text {
              anchors.left: parent.left
              anchors.leftMargin: 5
              id: mainPopup
              text: "main text"
              color:"black"
              font.pixelSize: 15

          }
      }

      Item{
          width:popup.width
          height:150

          TextInput{
              id:mainPostPopup
              anchors.left: parent.left
              anchors.leftMargin: 5
              maximumLength: 500
              font.pixelSize: 12
              anchors.margins: 5
              activeFocusOnTab: true
              width: parent.width-5
              wrapMode: Text.Wrap
              selectByMouse: true
              height:parent.height
              clip: true
              focus:true
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
          text:"add"
          font.pixelSize: 15
          onClicked: {
              popup.close();
              slot.addPost(titlePostPopup.text,mainPostPopup.text);
              postModel.append({"titlePost":titlePostPopup.text,"mainText":mainPostPopup.text,"idPost":newId});
titlePostPopup.text=""
              mainPostPopup.text=""
          }
          anchors.horizontalCenter: columnPopup.horizontalCenter
      }
  }

}
}
