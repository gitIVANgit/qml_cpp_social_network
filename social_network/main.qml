import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import Util 1.0
ApplicationWindow {
    width: 640
    height: 480
    visible: true
    minimumHeight: 400
    minimumWidth: minimumHeight
    color: "black"
    title: qsTr("Hello World")
    id:windowRoot
    header:HeaderDataType {
        anchors.margins:10
    }

    contentData:StackView{
        id:mainStackView
        anchors.fill: parent
        initialItem: MyContentItem{}

    }


    }


