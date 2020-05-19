import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

import QtQuick.Scene3D 2.14
import QtQuick.Scene3D 2.0
import QtQuick3D 1.14
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import Qt3D.Render 2.14
Rectangle {
    id: cadRoot
    property alias visibleCadRoot: cadRoot.visible
    anchors.left: parent.left
    anchors.top: parent.top

    anchors.leftMargin: 5
    anchors.topMargin: 30
    radius: 10
    color: Qt.rgba(32,32,32,0.3)

    Text {
        id: info
        text: qsTr("Cad. Mi apro/chiudo con 1")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 5

    }



}










