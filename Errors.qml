import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtCharts 2.14
import QtQuick.Controls 1.4

Rectangle {
    id: errorsRoot
    property alias visibleErrorRoot: errorsRoot.visible
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    anchors.margins: 1
    radius: 10
    color: "transparent"

    property var messDisplayed: 0

    property var currentTimer: 0

    property var index: 0




    function addErrorMessage(messageCode, resolutionCode, messageText, priority){

        //Message code --> codice del messaggio
        //Resolution code --> codice del messaggio che mi risolve il messaggio corrente
        //MessageText --> testo messaggio
        //Priority --> 0 -> successo, 1 -> warnings, 2 -> error

        var interval = 0
        var running = false

        if(priority === 0){
            running = true
            interval = 10000
        }

        if(priority === 1){
            running = true
            interval = 15000
        }


        //console.log(index)

        var h=1;
        /*Controll message length*/
        h=parseInt((messageText.length/31)+1);
        var chunks=""
        for (var i = 0, charsLength = messageText.length; i < charsLength; i += 30) {
            chunks = chunks + messageText.substring(i, i + 30) + "\n"
        }

        console.log("Message chunks :"+chunks)
        console.log("My h: "+h+ "My length: "+messageText.length)

        messageModel.insert(0,{"idObj" : parseInt(index),"payload" : chunks, "priority": priority, "intervalTimer": interval, "runningTimer": running, "newh":h})
        index ++



    }



    ListView {
        id: messageView
        model: ListModel {
            id: messageModel;
        }
        anchors.fill: parent
        rotation: 180
        height: 300
        width: 200
        Layout.columnSpan: 2
        Layout.fillHeight: true
        Layout.fillWidth: true

        spacing: 5
        clip: true
        currentIndex: -1;
        delegate: Rectangle {
            width: messageView.width
            rotation: 180
            anchors.margins: 10
            height: 25+20*(newh-1)
            radius : 10
            border.color: {
                if(priority == 2)
                    return "red"
                else if(priority == 0)
                    return "green"
                return "black"
            }
            color: {
                if(priority == 2)
                    return Qt.rgba(209,0,0,0.1)
                else if(priority == 0)
                    return Qt.rgba(0,198,57,0.1)
                return Qt.rgba(255,255,255,0.2)
            }


            Text{

                text: payload
                color: "white"
                width:parent.width
                height: 20
               // anchors.centerIn: parent
                anchors.topMargin: 4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignHCenter
                anchors.fill: parent
              //anchors.top: parent.top




            }

            Timer{

                interval: intervalTimer; running: runningTimer; repeat: false
                onTriggered: {
                    //console.log(idObj + " Triggered " + payload + " " + priority)

                    messageModel.remove(model.index)
                }



            }

            MouseArea{
            anchors.fill: parent
            onClicked: {
                if(priority == 2)
                    messageModel.remove(model.index)
            }
            }

        }
    }

}

