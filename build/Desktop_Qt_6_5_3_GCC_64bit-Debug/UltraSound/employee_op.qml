import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 640
    height: 480

    signal backToDashboard()


    Rectangle {
        anchors.fill: parent
        color: "green"

        Image {
            id: bgIMG
            source: "file:///home/test/UltraSound/images/emp.jpg"
            anchors.fill: parent
        }

        Button {
            text: "Back"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 10
            z: 1
            onClicked: {
                handleBackToDashboard();
            }
        }

        Column {
            id: maincol1
            anchors.centerIn: parent
            spacing: 20
            Button {
                id: addExp
                text: "Add Expenses"
                onClicked: {
                    formLoader.source = "emp_exp.qml"
                    formLoader.visible = true
                    getExp.visible = false
                    addExp.visible =false
                }
            }
            Button {
                id: getExp
                text: "Get Expenses"
                onClicked: {

                }
            }
        }
    }
    Loader{
        id:formLoader
    }
}
