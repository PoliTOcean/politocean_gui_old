import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.1
import QtCharts 2.14


Rectangle{

    id: menu
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width/2
    height: parent.height/3
    radius: 10
    color: Qt.rgba(32,32,32,0.3)

    property int maxDepth: -5
    property alias menu_maxDepth: valueMaxDepth.text
    property alias chartsVisibleG: chartsVisible.text
    property alias rovVisibleG: rovVisible.text
    property alias errorsVisibleG: errorsVisible.text

    GridLayout {
        id: grid
        anchors.fill: parent

        rows: 5
        columns: 4

        Rectangle {

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 0
            Layout.column: 0
            color:"transparent"

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5
                text: "Current Max Depth"
            }

        }

        Rectangle {

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.row: 0
            Layout.column: 2
            color:"transparent"

            Text{
                id:valueMaxDepth
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5
                text: maxDepth
            }
        }


        Rectangle {

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.row: 0
            Layout.column: 3
            color:"transparent"

            TextField {
                id: maxDepthSet
                anchors.left: parent.left
                width: parent.width/3
                anchors.margins: 5
                placeholderText: maxDepth

            }

            Button {
                id: maxDepthButton
                anchors.right: parent.right
                width: parent.width/2
                anchors.margins: 5
                text: "Set"
                onClicked: {
                    var new_value = parseInt(maxDepthSet.text)
                    if(new_value >= 0){
                        addMessage("ErrMaxDepth","-1","Devi inserire un numero maggiore di 0!!!!!!!!!!!!!!!!!!!!!!!!!!!", 1)
                    } else {
                        maxDepth = new_value
                    }
                    return
                }
            }
        }




        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 1
            Layout.column: 0



            Button {
                id: chartsVisible
                anchors.fill: parent
                anchors.margins: 5

                palette {
                    button: "#d1d4c9"
                }
                text: "Charts not visible"
                onClicked: {

                    if(chartsVisibleG === "Charts not visible"){
                        chartsVisible.text = "Charts visible"
                       // chartsVisible.palette = { button: "black"}
                    } else {
                        chartsVisible.text = "Charts not visible"
                       // chartsVisible.palette = { button: "#d1d4c9"}
                    }
                    return
                }
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 1
            Layout.column: 2

            Button {
                id: rovVisible
                anchors.fill: parent
                anchors.margins: 5

                palette {
                    button: "#d1d4c9"
                }
                text: "ROV not visible"
                onClicked: {

                    if(rovVisibleG === "ROV not visible"){
                        rovVisible.text = "ROV visible"
                        //rovVisible.palette = { button: "black"}
                    } else {
                        rovVisible.text = "ROV not visible"
                        //rovVisible.palette = { button: "#d1d4c9"}
                    }
                    return
                }
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 2
            Layout.column: 0

            Button {
                id: errorsVisible
                anchors.fill: parent
                anchors.margins: 5

                palette {
                    button: "#d1d4c9"
                }
                text: "Errors not visible"
                onClicked: {
                    /*TODO: change button color onClicked*/
                    if(errorsVisibleG === "Errors not visible"){
                        errorsVisible.text = "Errors visible"
                       // errorsVisible.palette = { button: "black"}
                    } else {
                        errorsVisible.text = "Errors not visible"
                       // errorsVisible.palette = { button: "#d1d4c9"}
                    }
                    return
                }
            }
        }


        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 2
            Layout.column: 2



            Button {
                id: mode1
                anchors.fill: parent
                anchors.margins: 5

                palette {
                    button: "#d1d4c9"
                }
                text: "Mode 1"
                onClicked: {

                    addMessage("Mode 1 selected", 2)
                }
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 3
            Layout.column: 0

            Button {
                id: mode2
                anchors.fill: parent
                anchors.margins: 5

                palette {
                    button: "#d1d4c9"
                }
                text: "Mode 2"
                onClicked: {

                    addMessage("Mode 2 selected", 1)
                }
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 3
            Layout.column: 2



            Button {
                id: mode3
                anchors.fill: parent
                anchors.margins: 5

                palette {
                    button: "#d1d4c9"
                }
                text: "Mode 3"
                onClicked: {

                    addMessage("Mode 3 selected", 1)
                }
            }
        }
    }


}
