import QtQuick 2.4
import QtGamepad 1.12




BackgroundForm {
    property  Sensor targetSensor: null
    property  Menu targetMenu: null
    property  Errors targetError: null
   // property  Cad targetCad: null

    property bool value: false
   focus: true

Gamepad{
id: joy

}



   Keys.onPressed:{


       //if(event.key == Qt.Key_Minus) targetSensor.visibleGraficiRoot = !targetSensor.visibleGraficiRoot

       if(event.key == Qt.Key_Plus ) {
          console.log("connected: "+joy.connected)
           targetMenu.visible = !targetMenu.visible
       }

     //  if(event.key == Qt.Key_0) targetError.visibleErrorRoot = !targetError.visibleErrorRoot

    //   if(event.key == Qt.Key_1) targetCad.visibleCadRoot = !targetCad.visibleCadRoot

   }
}
