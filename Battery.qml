import QtQuick 2.0

Rectangle {
    id: battery

    function updateBatteryStatus(percentage){
        console.log("MEss "+percentage)
        var img = (parseInt(percentage/20)) +1 ;
        imgbattery.source= "assets/batteria/"+ img + ".png"
        console.log(imgbattery.source)
        percentagevalue.text=percentage+"%"

    }

    Text {
        id: percentagevalue
        text: qsTr("100%")
        font.pointSize: 13
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Image {
        id: imgbattery
        anchors.top: percentagevalue.bottom
        width: parent.width-10
        height: parent.height-percentagevalue.height
        anchors.horizontalCenter:  parent.horizontalCenter
        source: "assets/batteria/5.png"
    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
