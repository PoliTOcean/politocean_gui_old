import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.1
import QtCharts 2.14


Rectangle{

    id: menu
    //Vedi position
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    radius: 10
    color: Qt.rgba(32,32,32,0.3)

    property int maxDepth: -5
    property alias menu_maxDepth: textvalue.valueMaxDepth
    property alias chartsVisibleG: chartsVisibletext.text
    property alias rovVisibleG: rovVisibletext.text
    property alias errorsVisibleG: errorsVisibletext.text
    //    width: 380
    //    height: 513

    GridLayout {
        id: grid
        //        width: 500
        //        height: 300
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
                id: textvalue
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5
                text: "Current Max Depth: " +  maxDepth + " mt"
                property int valueMaxDepth: maxDepth
            }

        }



        Rectangle {

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.row: 0
            Layout.column: 2
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
                background: Rectangle{
                    id: maxDepthButtonbackground
                    border.width: 1
                    border.color: "black"
                    radius: 5
                    color: "#444444"
                }
                contentItem: Text{
                    id: maxDepthButtontext
                    text: "Set"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#bebebe"
                }
                onClicked: {
                    var new_value;
                    if(maxDepthSet.text)
                    {new_value = parseInt(maxDepthSet.text)
                        if(new_value >= 0 || new_value<=-100 ){
                            addMessage("ErrMaxDepth","-1","Devi inserire un numero compreso tra 0 e -100", 1)
                        }  else {
                            maxDepth = new_value
                        }}
                    else
                        addMessage("ErrMaxDepth","-1","Devi inserire un numero", 1)

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
                id: chartsVisible
                anchors.fill: parent
                anchors.margins: 5
                background: Rectangle{
                    id: chartbackgroundvisible
                    border.width: 1
                    border.color: "black"
                    radius: 5
                    color: "#444444"
                }


                contentItem: Text{
                    id: chartsVisibletext
                    text: "Charts not visible"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#bebebe"
                }

                onClicked: {
                    if(chartsVisibleG === "Charts not visible"){
                        chartsVisibletext.text = "Charts visible"
                        chartbackgroundvisible.color = "#bebebe"
                        chartsVisibletext.color = "#444444"

                    } else {
                        chartsVisibletext.text = "Charts not visible"
                        chartbackgroundvisible.color = "#444444"
                        chartsVisibletext.color = "#bebebe"
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
                id: rovVisible
                anchors.fill: parent
                anchors.margins: 5
                background: Rectangle{
                    id: rovbackgroundvisible
                    border.width: 1
                    border.color: "black"
                    radius: 5
                    color: "#444444"
                }


                contentItem: Text{
                    id: rovVisibletext
                    text: "ROV not visible"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#bebebe"
                }

                onClicked: {

                    if(rovVisibleG === "ROV not visible"){
                        rovVisibletext.text = "ROV visible"
                        rovbackgroundvisible.color ="#bebebe"
                        rovVisibletext.color = "#444444"
                    } else {
                        rovVisibletext.text = "ROV not visible"
                        rovbackgroundvisible.color ="#444444"
                        rovVisibletext.color = "#bebebe"
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
                background: Rectangle{
                    id: errorsbackgroundvisible
                    border.width: 1
                    border.color: "black"
                    radius: 5
                    color: "#444444"
                }

                contentItem: Text{
                    id: errorsVisibletext
                    text: "Errors not visible"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#bebebe"
                }
                onClicked: {
                    if(errorsVisibleG === "Errors not visible"){
                        errorsVisibletext.text = "Errors visible"
                        errorsbackgroundvisible.color ="#bebebe"
                        errorsVisibletext.color = "#444444"
                    } else {
                        errorsVisibletext.text = "Errors not visible"
                        errorsbackgroundvisible.color ="#444444"
                        errorsVisibletext.color = "#bebebe"
                    }
                    return
                }
            }
        }


        //        Rectangle {
        //            color: "transparent"
        //            Layout.fillHeight: true
        //            Layout.fillWidth: true
        //            Layout.columnSpan: 2
        //            Layout.rowSpan: 1
        //            Layout.row: 2
        //            Layout.column: 2



        //            Button {
        //                id: mode1
        //                anchors.fill: parent
        //                anchors.margins: 5

        //                palette {
        //                    button: "#d1d4c9"
        //                }
        //                text: "Mode 1"
        //                onClicked: {

        //                    addMessage("Mode 1 selected", 2)
        //                }
        //            }
        //        }

        //        Rectangle {
        //            color: "transparent"
        //            Layout.fillHeight: true
        //            Layout.fillWidth: true
        //            Layout.columnSpan: 2
        //            Layout.rowSpan: 1
        //            Layout.row: 3
        //            Layout.column: 0

        //            Button {
        //                id: mode2
        //                anchors.fill: parent
        //                anchors.margins: 5

        //                palette {
        //                    button: "#d1d4c9"
        //                }
        //                text: "Mode 2"
        //                onClicked: {

        //                    addMessage("Mode 2 selected", 1)
        //                }
        //            }
        //        }

        //        Rectangle {
        //            color: "transparent"
        //            Layout.fillHeight: true
        //            Layout.fillWidth: true
        //            Layout.columnSpan: 2
        //            Layout.rowSpan: 1
        //            Layout.row: 3
        //            Layout.column: 2



        //            Button {
        //                id: mode3
        //                anchors.fill: parent
        //                anchors.margins: 5

        //                palette {
        //                    button: "#d1d4c9"
        //                }
        //                text: "Mode 3"
        //                onClicked: {

        //                    addMessage("Mode 3 selected", 1)
        //                }
        //            }
        //        }
    }
    states: [
        State {
            name: "State1"
        }
    ]//grid


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
