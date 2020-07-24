import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.1
import QtCharts 2.14

Item {
    id: element
    Rectangle {
        id: rectmenu
        x: 151
        y: 37
        width: 400
        height: 200
        color: "#ffffff"
        anchors.verticalCenterOffset: -1
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Grid {
            id: grid
            rows: 10
            columns: 4
            anchors.fill: parent

            DelayButton {
                id: delayButton
                text: qsTr("Delay Button")
            }

            Button {
                id: button
                text: qsTr("Sensors Charts")
                topPadding: 6
                checkable: true
                checked: false
                highlighted: false
                flat: false
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.row: 0
                Layout.column: 3
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:200;anchors_width:200;anchors_x:151;anchors_y:57}
}
##^##*/
