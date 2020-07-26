import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.14

import QtQuick.Layouts 1.1
import QtCharts 2.14

Rectangle{
    id: sensorroot
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.margins: 10
    color: "transparent"
    property alias visibleGraficiRoot: graficiroot.visible
    property alias maxDepth: ay.min

    property string newmess: ''




    property int amountOfDataTemp: 0
    property int amountOfDataPress: 0
    property int time: 0

    function addMessage(TempEx,TempIn,Press)
    {



        seriesTempEx.append(time, TempEx);
        seriesTempIn.append(time, TempIn);

        seriesPress.clear()
        seriesPress.append(0.5,Press)

        pressPuntuale.text = Press + " mt"
        tempEPuntuale.text = "Ex: " + TempEx + " C"
        tempIPuntuale.text = "In: " + TempIn + " C"

        time ++

        if(amountOfDataTemp > axisXtemp.max){
            axisXtemp.min++;
            axisXtemp.max++;
        }else{
            amountOfDataTemp++; //This else is just to stop incrementing the variable unnecessarily
        }

        /*if(amountOfDataPress > axisXpress.max){
            axisXpress.min++;
            axisXpress.max++;
        }else{
            amountOfDataPress++; //This else is just to stop incrementing the variable unnecessarily
        }*/


    }

    Rectangle {
        id: graficiroot
        width:parent.width/2
        color: "transparent"
        radius:10
        anchors.right: sensorroot.right
        anchors.top: sensorroot.top

        Rectangle {
            id: titoli
            height: 30
            width:parent.width
            radius: 10
            anchors.right: parent.right
            anchors.left: parent.left
            color: Qt.rgba(32,32,32,0.3)

            Rectangle {
                id:titoloPressione
                height: parent.height
                width: parent.width/3
                anchors.right: parent.right
                color: "transparent"

                Text {
                    id:textPressione
                    text: "Altitudine"
                    color: "#dddddd"
                    font.family: "Tahoma"
                    style: Text.Normal
                    font.bold: true
                    anchors.verticalCenter: titoloPressione.verticalCenter
                    anchors.horizontalCenter: titoloPressione.horizontalCenter
                }
            }

            Rectangle{
                id:titoloTemperatura
                height: parent.height
                width: 2*parent.width/3
                anchors.left: parent.left
                color: "transparent"


                Text{
                    id:textTemperatura
                    text: "Temperatura"
                    color: "#dddddd"
                    font.family: "Tahoma"
                    style: Text.Normal
                    font.bold: true
                    anchors.verticalCenter: titoloTemperatura.verticalCenter
                    anchors.horizontalCenter: titoloTemperatura.horizontalCenter
                }
            }
        }

        Rectangle{
            id:grafici
            width: sensorroot.width/2
            height: sensorroot.height - titoli.height
            anchors.right: parent.right
            anchors.top: titoli.bottom
            color: Qt.rgba(32,32,32,0.2)
            radius:10


            Rectangle{
                id: graficoPressione
                width:parent.width/3
                height: parent.height
                anchors.right: parent.right
                anchors.top : parent.top
                color: "transparent"

                ChartView {
                    id: pressione
                    anchors.fill: parent
                    antialiasing: true
                    backgroundColor: 'transparent'
                    legend.visible: false
                    margins.bottom: 0
                    margins.top: 0
                    margins.right: 0
                    margins.left: 0

                    ScatterSeries {
                        id: seriesPress
                        onPointAdded: update()


                        axisX: ValueAxis{
                            id:ax
                            min: 0
                            max: 1
                            labelsVisible: false
                            tickCount: 3
                        }
                        axisY: ValueAxis{
                            id: ay
                            min: -5
                            max: 0
                            tickCount: 10
                            labelsFont:Qt.font({pointSize: 7})
                        }
                    }
                }
            }


            Rectangle{
                id: graficoTemperatura
                width:2*parent.width/3
                height: parent.height
                anchors.left: parent.left
                anchors.top : parent.top
                color: "transparent"

                ChartView {
                    id: temperatura
                    anchors.fill: parent
                    antialiasing: true
                    backgroundColor: 'transparent'
                    legend.visible: false
                    margins.bottom: 0
                    margins.top: 0
                    margins.right: 0
                    margins.left: 0


                    ValueAxis {
                        id: axisXtemp
                        labelsVisible: false
                        max: 60
                        min: 0
                    }

                    ValueAxis{
                        id: axisYtemp
                        max: 100
                        min: 0
                    }

                    LineSeries {
                        id: seriesTempEx
                        name: "Temp. Ext."
                        color: "yellow"
                        axisX: axisXtemp
                        axisY: axisYtemp
                        width: 2

                    }

                    LineSeries {
                        id: seriesTempIn
                        name: "Temp. Int."
                        color: "green"
                        axisX: axisXtemp
                        axisY: axisYtemp
                        width: 2

                    }
                }
            }

        } //grafici





    } //graficiroot

    Rectangle{
        id: puntuali
        radius: 5
        anchors.left: sensorroot.left
        anchors.top:  sensorroot.top
        //anchors.rightMargin: 40+titoli.width
        width:(parent.width/2)-40
        height: titoli.height*2
        color: Qt.rgba(32,32,32,0.3)


        Rectangle{
            id:imgtemp
            width:  parent.width*2/10
            height: parent.height
            anchors.left: parent.left
            anchors.top:  parent.top
            color: Qt.rgba(19,19,19,0)
            Image {
                id: tempimage
                width:  parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                source: "assets/weather.png"
            }

        }

        Rectangle{
            id:tempI
            height: parent.height
            width:  parent.width*3/10
            anchors.left: imgtemp.right
            anchors.top:  parent.top
            color: Qt.rgba(19,19,19,0)

            Text {
                id: tempIPuntuale
                text: qsTr("Int: nd")
                //anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                anchors.topMargin: 5
                color: "#dddddd"
                font.family: "Tahoma"
                style: Text.Normal
                font.bold: true

            }

            Text {
                id: tempEPuntuale
                text: qsTr("Ext: nd")
                //anchors.verticalCenter: parent.verticalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                color: "#dddddd"
                font.family: "Tahoma"
                style: Text.Normal
                font.bold: true

            }

        }

        Rectangle{
            id: imgpress
            height: parent.height
            width:  parent.width*2/10
            anchors.left: tempI.right
            anchors.top:  parent.top
            color: Qt.rgba(19,19,19,0)
            Image {
                id: pressimage
                width:  parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                source: "assets/pressure.png"
            }
        }

        Rectangle{
            id: pressure
            height: parent.height
            width:  parent.width*3/10
            anchors.left: imgpress.right
            anchors.top:  parent.top

            color: Qt.rgba(19,19,19,0)

            Text {
                id: pressPuntuale
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("nd")
                color: "#dddddd"
                font.family: "Tahoma"
                style: Text.Normal
                font.bold: true
            }
        }
    }


 }
