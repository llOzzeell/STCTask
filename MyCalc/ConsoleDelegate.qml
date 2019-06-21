import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

Item {
    id:root
    width: parent.width
    height: 30


    property int messageType
    onMessageTypeChanged: {
        switch(messageType){
        case 0: rectangle.color = requestColor; break;
        case 1: rectangle.color = resultColor; break;
        case -1: rectangle.color = errorColor; break;
        }
    }

    property string messageString:"---"
    property int duration:-1

    property color itemBackground:Material.primary
    property color requestColor: Material.color(Material.Green, Material.ShadeA400)
    property color resultColor: Material.color(Material.LightBlue, Material.Shade500)
    property color errorColor: Material.color(Material.Red, Material.Shade500)

    Pane {
        id: pane
        anchors.fill: parent
        Material.elevation: 6
        Material.background: Qt.lighter(consoleRect.color, 1.2)
    }

    Rectangle {
        id: rectangle
        y: 0
        width: root.height/2.5
        height: width
        color: requestColor
        radius: height/2
        anchors.leftMargin: radius
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            samples: 18
            radius:8
        }
    }

    Label {
        id: label
        x: 34
        y: -2
        height: 34
        text: messageString
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
        font.capitalization: Font.AllUppercase
        font.bold: true
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: rectangle.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: rectangle.color
    }
}
