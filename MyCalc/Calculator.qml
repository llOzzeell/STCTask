import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2


Item {
    id: root
    width: 400

    property string fieldString:"0"
    property var lastTask:[0,0,0];

    property var operatorArray:["/","x","-","+"];

    function buttonClicked(name){
        if(name === "C") { clear(); return; }
        if(name === "=")  { equalPush(); return; }
        if(name === "<")  { backPush(); return; }

        if(containOperator(name)){

            operatorClicked(name);
            return;
        }

        if(fieldString === "0" || fieldString === "Ошибка")fieldString = "";
        fieldString += name;
    }

    function backPush(){
        if(fieldString.length > 1) fieldString = fieldString.substring(0, fieldString.length-1);
        else fieldString = "0";
    }

    function containOperator(string){
        var result = false;
        operatorArray.forEach(function(element){
            if(string.indexOf(element) >= 0) result = true;
        })
        return result;
    }

    function getOperatorFromString(string){
        var result = "";
        operatorArray.forEach(function(element){
            if(string.indexOf(element) >= 0) result = element;
        })
        return result;
    }

    function getOperatorIntFromString(string){
        var result;
        operatorArray.forEach(function(element){
            if(string.indexOf(element) >= 0) result = element;
        })

        switch(result){
        case "/": return 0;
            case "x": return 1;
                case "-": return 2;
                    case "+": return 3;
        }
    }

    function operatorClicked(name){
        if(fieldString != "Ошибка"){
            if(containOperator(fieldString)){
                fieldString = fieldString.replace(getOperatorFromString(fieldString), name);
            }
            else{
                fieldString += name;
            }
        }
    }

    function clear(){
        fieldString = "0";
    }

    function saveLastTAsk(A,B,Type){
        lastTask[0] = A;
        lastTask[1] = B;
        lastTask[2] = Type;
    }

    function loadLastTask(){
        if(lastTask[0].length > 0 && lastTask[0].length > 0 && lastTask[2] !== undefined && lastTask[2] >= 0){
            core.setRequest(lastTask[0],lastTask[1],lastTask[2],Math.round(calcHold.value));
        }
    }

    function equalPush(){

        var A = fieldString.substring(0, fieldString.indexOf(getOperatorFromString(fieldString)));
        var B = fieldString.substring(fieldString.indexOf(getOperatorFromString(fieldString))+1);
        var Type = getOperatorIntFromString(fieldString)
        if(A.length > 0 && B.length > 0 && Type !== undefined && Type >= 0){
            core.setRequest(A,B,Type,Math.round(calcHold.value));
        }
        else{
            _console.addItem(-1, "Введите операцию");
        }
    }

    Item {
        id: numberFieldItem
        height: 200
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Label {
            id: numberFieldLabel
            y: 80
            height: 120
            text: fieldString
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.left: parent.left
            leftPadding: 8
            rightPadding: 8
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: fontSizeDefault
            fontSizeMode: Text.Fit

            property bool isFontSizeModified:false
            property real fontSizeDefault: numberFieldLabel.height/1.8

        }
    }

    Item {
        id: keysItem
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.top: numberFieldItem.bottom
        anchors.right: parent.right

        property int keyWidth: keysItem.width/4 - 2
        property int keyHeight: keysItem.height/5 - 2

        CalculatorButton {
            id: btn7
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            isOperatorButton: false
            name:"7"
            ma.onClicked: buttonClicked(name);

        }

        CalculatorButton {
            id: btn8
            name: "8"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.left: btn7.right
            anchors.leftMargin: 2
            anchors.top: parent.top
            anchors.topMargin: 0
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);

        }

        CalculatorButton {
            id: btn9
            name: "9"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: btn8.right
            anchors.leftMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);

        }

        CalculatorButton {
            id: btnDiv
            name: "/"
            height: keysItem.keyHeight
            anchors.left: btn9.right
            anchors.leftMargin: 2
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btn4
            name: "4"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: btn7.bottom
            anchors.topMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 0
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);

        }

        CalculatorButton {
            id: btn5
            name: "5"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: btn8.bottom
            anchors.topMargin: 2
            anchors.left: btn4.right
            anchors.leftMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);

        }

        CalculatorButton {
            id: btn6
            name: "6"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: btn9.bottom
            anchors.topMargin: 2
            anchors.left: btn5.right
            anchors.leftMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);

        }

        CalculatorButton {
            id: btnMulti
            name: "x"
            height: keysItem.keyHeight
            anchors.left: btn6.right
            anchors.leftMargin: 2
            anchors.top: btnDiv.bottom
            anchors.topMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 2
            isOperatorButton: true
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btn1
            name: "1"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: btn4.bottom
            anchors.topMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 0
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btn2
            name: "2"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: btn5.bottom
            anchors.topMargin: 2
            anchors.left: btn1.right
            anchors.leftMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btn3
            name: "3"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.top: btn6.bottom
            anchors.topMargin: 2
            anchors.left: btn2.right
            anchors.leftMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btnMinus
            name: "-"
            height: keysItem.keyHeight
            anchors.left: btn3.right
            anchors.leftMargin: 2
            anchors.top: btnMulti.bottom
            anchors.topMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btn0
            name: "0"
            width: keysItem.keyWidth*3+4
            height: keysItem.keyHeight
            anchors.top: btn1.bottom
            anchors.topMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 0
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btnPlus
            name: "+"
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.left: btn0.right
            anchors.leftMargin: 2
            anchors.top: btnMinus.bottom
            anchors.topMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btnC
            name: "C"
            width: keysItem.keyWidth
            anchors.top: btn0.bottom
            anchors.topMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 0
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btnEq
            name: "="
            anchors.top: btn0.bottom
            anchors.topMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            anchors.left: btnBackspace.right
            anchors.leftMargin: 2
            isOperatorButton: false
            ma.onClicked: buttonClicked(name);
        }

        CalculatorButton {
            id: btnBackspace
            name: "<"
            x: -9
            y: 304
            width: keysItem.keyWidth
            height: keysItem.keyHeight
            anchors.topMargin: 2
            anchors.bottomMargin: 2
            isOperatorButton: true
            anchors.bottom: parent.bottom
            anchors.leftMargin: 2
            anchors.top: btn0.bottom
            anchors.left: btnC.right
            ma.onClicked: buttonClicked(name);
        }
    }
}
