import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 1024
    height: 768
    color: "#1E1E1E"

    Rectangle {
        id: header
        height: 60
        width: parent.width
        color: "#2B2B2B"
        anchors.top: parent.top

        Text {
            text: qsTr("Digital Expert")
            font.pointSize: 20
            font.bold: true
            color: "#FFFFFF"
            anchors.centerIn: parent
        }

        Row {
            spacing: 15
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter

            Text {
                text: qsTr("Login")
                color: "lightblue"
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        loadForm("login.qml");
                    }
                }
            }

            Text {
                text: qsTr("Sign Up")
                color: "lightblue"
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        loadForm("signup.qml");
                    }
                }
            }

            Text {
                text: qsTr("Contact")
                color: "lightblue"
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        loadForm("contact.qml");
                    }
                }
            }

            Text {
                text: qsTr("Exit")
                color: "lightblue"
                font.bold: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.quit();
                    }
                }
            }
        }
    }

    Rectangle {
        width: 200
        height: 200
        color: "transparent"
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

        Image {
            source: "file:///home/test/UltraSound/images/airaacolour.png"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 10
            width: 150
            height: 150
        }
    }

    RowLayout {
        id: mainContent
        anchors {
            top: header.bottom
            bottom: footer.top
            left: parent.left
            right: parent.right
            margins: 10
        }
        spacing: 20

        Rectangle {
            Layout.fillWidth: true
            color: "transparent"

            Text {
                id: welcomeText
                text: "AIRAA CORPORATES LLP"
                font.pointSize: 28
                font.bold: true
                color: "#FFFFFF"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Rectangle {
        id: footer
        height: 40
        width: parent.width
        color: "#2B2B2B"
        anchors.bottom: parent.bottom

        Text {
            text: qsTr("© 2024 AIRAA CORPORATES LLP All Rights Reserved.")
            font.pointSize: 12
            color: "#FFFFFF"
            anchors.centerIn: parent
        }
    }

    Loader {
        id: formLoader
        anchors.fill: parent

        onLoaded: {
            if (formLoader.item) {
                formLoader.item.backToDashboard.connect(handleBackToDashboard);
            }
        }
        onSourceChanged: {
            mainContent.visible = !formLoader.visible;
        }
    }

    function loadForm(formSource) {
        formLoader.source = formSource;
        formLoader.visible = true;
    }

    function handleBackToDashboard() {
        console.log("Back to dashboard handler executed");
        formLoader.visible = false;
        mainContent.visible = true;
    }
}
