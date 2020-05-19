import QtQuick 2.4

Item {
    width: 400
    height: 400

    Rectangle {
        id: rectangle
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.36
                color: "#191919"
            }

            GradientStop {
                position: 1
                color: "#313131"
            }
        }
    }
}
