import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

import QtMultimedia 5.12
import QtQuick.Scene3D 2.14
import QtQuick3D 1.14
import Qt3D.Core 2.12
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.12
import Qt3D.Render 2.14
//Rectangle {
//    id: cadRoot
//    property alias visibleCadRoot: cadRoot.visible
//    anchors.left: parent.left
//    anchors.top: parent.top

//    anchors.leftMargin: 5
//    anchors.topMargin: 30
//    radius: 10
//    color: Qt.rgba(32,32,32,0.3)
//    Text {
//        id: info
//        text: qsTr("Cad. Mi apro/chiudo con 1 ora non più")
//        anchors.left: parent.left
//        anchors.top: parent.top
//        anchors.margins: 5

//    }



Entity {
    id: sceneRoot


//    function StatusCamera(value){
//        if(value)
//            camera.
//    }

    function addMessage(Pitch,Yaw,Roll)
    {
        rovTransform.rotationX=Pitch;
        rovTransform.rotationY=Yaw;
        rovTransform.rotationZ=Roll;

    }


    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane : 0.1
        farPlane : 1500.0
        position: Qt.vector3d(0, 0, 800 )
        //  position: Qt.vector3d( 0.0, 0.0, 500.0 )
        //        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        //        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )




    }

    FirstPersonCameraController { camera: camera}



    components: [
        DirectionalLight {
                      worldDirection: Qt.vector3d(0,2.0, 0.0).normalized();
                      color: "white"
                      intensity: 1
                  },RenderSettings {
            activeFrameGraph: ForwardRenderer {
                camera: camera
                clearColor: "transparent"
            }
        }/*,
        InputSettings {}*/

    ]

    PhongMaterial {
        id: material
    }


    SceneLoader
    {
        id: sceneLoader
        source: "file:///home/fedeb/Developer/politocean/politocean_gui/ROV_COLORI.obj"


    }


    Transform {
        id: rovTransform
        rotationX: 0    //pitch
        rotationY: 0    //yaw
        rotationZ: 0    //roll //asse uscente

    }


    Entity {
        id: torusEntity
        components: [ sceneLoader, material, rovTransform]
    }


}


//}










