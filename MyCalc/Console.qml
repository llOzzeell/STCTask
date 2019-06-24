import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Item {
    id:root
    width: 300
    height: 400

    function addItem(type, message, duration){
        listModel.append({"msgType":type, "msgString":qsTr(message), "durTime":duration});
    }

    ListModel{
        id:listModel
    }

    Component{
        id:delegateItem
        ConsoleDelegate{
            messageType: msgType
            messageString: msgString
            width:listView.width
        }
    }

    ListView {
        id: listView
        anchors.bottomMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.leftMargin: 10
        spacing: 6
        anchors.fill: parent
        model: listModel
        delegate: delegateItem
        currentIndex: listModel.count-1
   }
}

