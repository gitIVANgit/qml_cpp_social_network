pragma Singleton
import QtQuick 2.0
QtObject {
property string mainBackgroundColor:"#87cefa"
    property string mainBackgroundBorderColor:"#779e9e"
    property int mainBackgroundRadius:5
    property int mainButtonRadius:5
    property string mainButtonColorBackground:"#6495ed"
    property color mainButtonColorBorder:Qt.darker("#6495ed",1.2)
    property int mainButtonBorderWidth:3
    property string mainTitleColorNotHover:"#6495ed"
    property color mainTitleColorHover:Qt.darker("#6495ed",1.4)
    property int mainMargin:10
    property color mainButtonColorBackgroundHovered:Qt.darker("#6495ed",1.2)
    property string mainBackgroundTextInfo:"We're building the next \n evolution of digital \n connection"
    property int mainContentItemHeight:20
    property string mainSubmitButtonColorBackground:"lightgreen"

}
