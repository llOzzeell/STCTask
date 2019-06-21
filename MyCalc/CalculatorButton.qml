import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

Item {
    id: root
    width: 80
    height:80
    Component.onCompleted: checkName()

    property alias ma: mouseArea
    property bool isOperatorButton: false
    property var operatorsCharArray: ["+","-","/","*","C","="]
    property string name:"?"
    property int animationDuration: 200

    function checkName(){
        operatorsCharArray.forEach(function(element) {
            if(name.indexOf(element) == 0){
                root.isOperatorButton = true;
                return;
            }
          });
    }

    Rectangle {
        id: rectangle
        color: isOperatorButton? operatorButtonColor: numberButtonColor
        anchors.fill: parent
        radius: 2

        SequentialAnimation{
            id:animationBlink
            PropertyAnimation{
                target:rectangle
                properties: "color"
                from: isOperatorButton? operatorButtonColor: numberButtonColor
                to:Material.foreground
                duration: animationDuration/2
            }
            PropertyAnimation{
                target:rectangle
                properties: "color"
                from:Material.foreground
                to: isOperatorButton? operatorButtonColor: numberButtonColor
                duration: animationDuration/2
            }

        }

        function blink(){
            animationBlink.running = true
        }

    }

    Label {
        id: nameLabel
        color: Material.background
        text: name
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: isOperatorButton? root.height/3 : root.height/3
        anchors.fill: parent
    }

    PropertyAnimation{
        id:animationFontSizeUp
        target:nameLabel
        properties: "font.pixelSize"
        from:isOperatorButton? root.height/3 : root.height/3
        to:nameLabel.font.pixelSize * 1.11
        duration: animationDuration/2
    }
    PropertyAnimation{
        id:animationFontSizeDown
        target:nameLabel
        properties: "font.pixelSize"
        from:nameLabel.font.pixelSize * 1.11
        to:isOperatorButton? root.height/3 : root.height/3
        duration: animationDuration/2
    }




    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: rectangle.blink()
        onEntered: animationFontSizeUp.running = true
        onExited: animationFontSizeDown.running = true
    }

}
