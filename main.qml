import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtCharts 2.14
import MqttClient 1.0

//TODO --> gestire disconnessione mqtt, valori non consoni mqtt

import QtQuick.Scene3D 2.0
import QtQuick3D 1.14

ApplicationWindow {
    visible: true

    width: 1500
    height: 800
    title: qsTr("PolitOcean--GIT")

    function addMessage(code,resolutionCode,message, priority){

        var mes = code + "," + resolutionCode + "," + message + "," + priority
        clientMain.publishme("Errors",mes,0,false)

    }

    MqttClient {
        id: clientMain
        hostname: "localhost"
        port: portField.text
    }

    Background{
        id:background
        anchors.fill: parent
        targetMenu: menu
        targetSensor: sensori
        targetError: errors
        //targetCad: cad

        TextField {
            id: portField
            width: parent.width
            height: 30
            text: "1883"
            placeholderText: "<Port>"
            inputMethodHints: Qt.ImhDigitsOnly
            enabled: clientMain.state === MqttClient.Disconnected

        }

        TextField {
            id: hostnameField
            width: parent.width
            height: 30
            text: "localhost"
            placeholderText: "<Enter host running MQTT broker>"
            enabled: clientMain.state === MqttClient.Disconnected

        }

        Streaming{
            id:stream
            width: parent.width
            height: parent.height
        }

        Menu{
            id:menu
            width:parent.width/3
            height:parent.height/4
            visible: false
        }

        Sensor{
            id:sensori
            width: parent.width*2/3 //+40
            height: parent.height/3 //+20
//            width: parent.width*6/8
//            height: parent.height/4
            visibleGraficiRoot: visibleCheck()
            maxDepth: menu.maxDepth
            function visibleCheck(){
                if( menu.chartsVisibleG === "Charts not visible")
                    return false
                else
                    return true
            }

        }

        Errors{
            id:errors
            width:parent.width/5
            height:parent.height/2
            visibleErrorRoot : visibleCheck()

            function visibleCheck(){
                if( menu.errorsVisibleG === "Errors not visible")
                    return false
                else
                    return true
            }
        }


        Rectangle{
            id:cadRoot
            width:parent.width/4
            height:parent.height/4
              //  property alias visibleCadRoot: cadRoot.visible
             // visible: false
             anchors.left: parent.right
                anchors.top: parent.top
               anchors.leftMargin: 5
               anchors.topMargin: 5
                radius: 10
                color:  backgroundcad()
            function visibleCheck(){
                if( menu.rovVisibleG === "ROV not visible")
                    return false
                else
                    return true
            }
            function backgroundcad(){
                if( menu.rovVisibleG === "ROV not visible")
                {  // cadRoot.height=0
                    cadRoot.anchors.left=parent.right

                    return "transparent"
                }
                else{
                      cadRoot.anchors.left=parent.left
                    return Qt.rgba(32,32,32,0.3)}
            }

            Scene3D {
                id: scene3d

                anchors.fill: parent
                anchors.margins: 10
                //focus: true
                aspects: ["input", "logic"]
                cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
//                hoverEnabled: true
//               visible: false

                Cad{
                    id: cadElement

                    //visibleCadRoot :  visibleCheck()
                }
            }


        }

//        Rectangle{

//            id : statusMqttBox

//            width:parent.width/4
//            height:20
//            anchors.left: parent.left
//            anchors.top: parent.top
//            anchors.leftMargin: 5

//            anchors.margins: 5
//            radius: 10
//            color: Qt.rgba(32,32,32,0.3)

//            Text {
//                id: statusMqtt

//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.margins: 2
//                color:  if(clientMain.state === MqttClient.Connected){
//                            return "green"
//                        } else  {
//                            return "black"
//                        }

//                text: "Status Mqtt connection: " + stateToString(clientMain.state)
//                enabled: clientMain.state === MqttClient.Connected

//            }

//        }





    }




    Timer {
        id: timer
        interval: 500; running: true; repeat: true
        onTriggered: timerTriggered(clientMain)
    }

    /*Timer {
        id: timer1
        interval: 5000; running: true; repeat: true
        onTriggered: sendMessage()
    }

    Timer {
        id: timer2
        interval: 3000; running: true; repeat: true
        onTriggered: sendMessage2()
    }


    property var i: true
    property var j : 0


    property var k: true
    property var y : 0


    For Debugging !!
    function sendMessage(){

        if (k){

            addMessage("MqttSub",-1,"Connected to topic Sensors2"+k,2)

        } else {

            addMessage("MqttConn",-1,"Connected to mqtt"+k,1)

        }

        k = !k

        if(y===1){
            timer1.running=false
        }

        y ++



    }

    function sendMessage2(){

        if (i){

            addMessage("MqttSub",-1,"Connected to topic Sensors2" + j,0)

        } else {

            addMessage("MqttConn",-1,"Connected to mqtt" + j,1)

        }

        i = !i

        if(j===1){
            timer1.running=false
        }
        j++



    }*/

    property var tempSubscriptionSensors: 0
    property var tempSubscriptionErrors: 0

    function timerTriggered(){

        clientMain.connectToHost()

        console.log("Connecting to mqtt")

        if(clientMain.state === MqttClient.Connected){
            timer.running = false

            tempSubscriptionSensors = clientMain.subscribe("Sensors")
            tempSubscriptionErrors = clientMain.subscribe("Errors")

            tempSubscriptionSensors.messageReceived.connect(checkSensorsValues)
            tempSubscriptionErrors.messageReceived.connect(checkErrorsValues)

            addMessage("MqttConn",-1,"Connected to mqtt ",0)

            addMessage("MqttSub",-1,"Error example-click to delete",2)



        }
    }

    function checkSensorsValues(payload) {

        //messageModel.insert(0, {"payload" : payload})
        //console.log(payload)
        var newmess=payload

        var values = newmess.split(",");

        //TODO ERRORE NON ABBASTANZA VALORI


        var TempEx = parseInt(values[0]);
        var TempIn = parseInt(values[1]);
        var Press = parseFloat(values[2]);
        var Pitch = parseFloat(values[3]);
        var Roll = parseFloat(values[4]);
        var Yaw = parseFloat(values[5]);

        //TODO MIN MAX

        sensori.addMessage(TempEx,TempIn,Press)
        cadElement.addMessage(Pitch,Yaw,Roll)

    }


    function checkErrorsValues(payload) {

        //messageModel.insert(0, {"payload" : payload})
        //console.log(payload)
        var m = payload.split(",")

        errors.addErrorMessage(m[0],m[1],m[2],parseInt(m[3]))
    }




    function stateToString(value) {
        if (value === 0)
            return "Disconnected"
        else if (value === 1)
            return "Connecting"
        else if (value === 2)
            return "Connected"
        else
            return "Unknown"
    }
}
