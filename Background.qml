import QtQuick 2.4

BackgroundForm {
    property  Sensor targetSensor: null
    property  Menu targetMenu: null
    property  Errors targetError: null
   // property  Cad targetCad: null

   focus: true

   Keys.onPressed:{


       //if(event.key == Qt.Key_Minus) targetSensor.visibleGraficiRoot = !targetSensor.visibleGraficiRoot

       if(event.key == Qt.Key_Plus) targetMenu.visible = !targetMenu.visible

     //  if(event.key == Qt.Key_0) targetError.visibleErrorRoot = !targetError.visibleErrorRoot

    //   if(event.key == Qt.Key_1) targetCad.visibleCadRoot = !targetCad.visibleCadRoot

   }
}
