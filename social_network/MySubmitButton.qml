import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
Rectangle {
    id:submitButton
    property string textButtonSubmit
    color:MyStyle.mainSubmitButtonColorBackground
    border.color:MyStyle.mainButtonColorBorder
    border.width: MyStyle.mainButtonBorderWidth
    radius: MyStyle.mainButtonRadius
    Text {
        anchors.centerIn: parent
        text: textButtonSubmit
        font.pixelSize: parent.height*0.5
        color:"red"
    }


    }
