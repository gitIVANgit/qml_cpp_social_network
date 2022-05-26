import QtQuick 2.0

Rectangle {
    property string textButton

    color:MyStyle.mainButtonColorBackground
    border.color:MyStyle.mainButtonColorBorder
    border.width: MyStyle.mainButtonBorderWidth
    radius: MyStyle.mainButtonRadius
    Text {
        anchors.centerIn: parent
        text: textButton
        font.pixelSize: parent.height*0.5
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {parent.color=MyStyle.mainButtonColorBackgroundHovered}
        onExited: {  parent.color=MyStyle.mainButtonColorBackground}
        onClicked: {
            if(textButton=="register"){
            mainStackView.push("qrc:/MyRegisterStartPage.qml")
        }else{
                mainStackView.push("qrc:/MyLoginStartPage.qml")

            }
        }
    }
}
