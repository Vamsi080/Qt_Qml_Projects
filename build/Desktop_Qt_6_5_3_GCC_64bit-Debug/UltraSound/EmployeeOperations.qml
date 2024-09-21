import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 1024
    height: 768

    signal backToDashboard()

    Image {
        id: bgIMG
        source: "file:///home/test/UltraSound/images/istockphoto-1390650720-612x612.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        width: parent.width
        height: 60
        color: "#2B2B2B"
        anchors.top: parent.top

        Button {
            text: "Back"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 10
            onClicked: {
                backToDashboard();
            }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 150
        spacing: 20

        Text {
            text: qsTr("Address:\n1306, 3rd Floor, Ardente Office One, Hoodi Circle,\nITPL Main Road, Whitefield, Bengaluru, Karnataka 560067")
            font.family: "Ubuntu"
            font.bold: true
            font.pointSize: 16
            color: "white"
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: qsTr("Contact Us at:\nPhone: +91-12345-67890\nEmail: info@airaacorp.com")
            font.family: "Ubuntu"
            font.italic: true
            font.pointSize: 16
            color: "#FFFFFF"
            //wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
