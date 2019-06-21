import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import com.CalculatorCore 1.0

Window {
    id: window
    visible: true
    width: 580
    minimumWidth: 580
    height: 550
    minimumHeight: 550
    title: qsTr("STC test task")

    Material.theme: Material.Dark
    Material.background: Material.color(Material.Grey, Material.Shade900);
    Material.primary: Material.color(Material.Grey, Material.Shade300);
    Material.accent: Material.color(Material.Orange, Material.Shade300);
    Material.foreground: Material.color(Material.Grey, Material.Shade50);
    property color operatorButtonColor: Material.accent
    property color numberButtonColor: Material.color(Material.Grey, Material.Shade300)

    Item {
        id: consoleItem
        width: (window.width/3)*1.5
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Rectangle {
            id: consoleRect
            color: Qt.lighter(Material.background, 1.6)
            clip: true
            anchors.fill: parent
        }

        Console {
            id: _console
            anchors.fill: parent
        }

    }

    Item {
        id: calcItem
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: consoleItem.left
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Rectangle {
            id: calcRect
            x: 2
            y: 0
            color: Qt.lighter(Material.background, 1.1)
            anchors.fill: parent
        }

        DropShadow{
            x: 2
            y: 0
            source: calcRect
            radius:16
            anchors.fill: parent
            samples: 32
        }

        Item {
            id: keypadItem
            x: 2
            y: 0
            height: 8
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.bottom: calcParamItem.top
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            Calculator {
                id: calculator
                anchors.fill: parent
            }
        }

        Item {
            id: calcParamItem
            x: 0
            y: 410
            height: 120
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Dial {
                //                id: calcHold
                //                y: 380
                //                width: calcParamItem.height/3
                //                height: width
                //                to: 30
                //                stepSize: 1
                //                anchors.left: parent.left
                //                anchors.leftMargin: (calcParamItem.height - height)/4
                //                anchors.verticalCenter: parent.verticalCenter
                id: calcHold
                y: 380
                width: 60
                height: width
                anchors.verticalCenterOffset: 0
                to: 30
                stepSize: 1
                anchors.left: parent.left
                anchors.leftMargin: 14
                anchors.verticalCenter: parent.verticalCenter
            }


            Column {
                id: column
                height: 93
                anchors.left: calcHold.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                spacing: 5


                Item {
                    id: param_1_Item
                    height: 20
                    width: parent.width
                    clip: true

                    Label {
                        id: label1
                        x: 0
                        y: 28
                        width: 152
                        height: 19
                        text: qsTr("время вычисления (сек):")
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 8
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.verticalCenter: parent.verticalCenter
                        font.capitalization: Font.AllUppercase
                        font.bold: false
                    }

                    Label {
                        id: calcHoldValueLabel
                        text: Math.round(calcHold.value)
                        font.pointSize: 12
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }

                Item {
                    id: param_2_Item
                    height: 20
                    width: parent.width
                    clip: true

                    Label {
                        id: label2
                        x: 0
                        y: 28
                        width: 152
                        height: 19
                        text: qsTr("очередь запросов (ед.):")
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 8
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: false
                        font.capitalization: Font.AllUppercase
                        anchors.leftMargin: 0
                        anchors.left: parent.left
                    }

                    Label {
                        id: requestCountLabel
                        text: qsTr("0")
                        font.pointSize: 12
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }

                Item {
                    id: param_3_Item
                    height: 20
                    width: parent.width
                    clip: true

                    Label {
                        id: label3
                        x: 0
                        y: 28
                        width: 152
                        height: 19
                        text: qsTr("очередь результатов (ед.):")
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 8
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: false
                        font.capitalization: Font.AllUppercase
                        anchors.leftMargin: 0
                        anchors.left: parent.left
                    }

                    Label {
                        id: resultCountLabel
                        text: qsTr("0")
                        font.pointSize: 12
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }
                }


                Item {
                    id: param_4_Item
                    width: parent.width
                    height: 20
                    Label {
                        id: label4
                        x: 0
                        y: 28
                        width: 152
                        height: 19
                        text: qsTr("обработка результатов")
                        verticalAlignment: Text.AlignVCenter
                        topPadding: 0
                        font.bold: false
                        font.pointSize: 8
                        anchors.verticalCenter: parent.verticalCenter
                        font.capitalization: Font.AllUppercase
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                    }

                    CheckBox {
                        id: procResCheckbox
                        x: 177
                        y: 23
                        width: 29
                        height: 44
                        text: qsTr("")
                        checked: true
                        anchors.verticalCenterOffset: 0
                        scale: 0.8
                        anchors.right: parent.right
                        anchors.rightMargin: -10
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    clip: false
                }


            }
        }
    }

    CalculatorCore{
        id:core
        processingResults: procResCheckbox.checked
        onSignalRequestCountChanged: requestCountLabel.text = value
        onResultCountChanged: resultCountLabel.text = value;
        onSignalResultReady: {
            if(errorCode >= 0) calculator.fieldString = result;
            else{
                calculator.fieldString = "Ошибка";
            }
        }
        onSignalSendMsgToBackPanel:{
            _console.addItem(msgType, msg, duration);
        }
    }
}

