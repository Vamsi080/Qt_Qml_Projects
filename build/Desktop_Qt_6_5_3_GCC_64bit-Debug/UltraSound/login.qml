import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    width: 640
    height: 480
    visible: true

    Image {
        id: bgIMG
        source: "file:///home/test/UltraSound/images/abstract-digital-technology-background-with-concept-security-vector.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    signal loginSuccessful()
    signal signupRequested()
    signal backToDashboard()

    Button {
        text: "Back"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10
        onClicked: {
            backToDashboard();
        }
    }

    Image {
        source: "file:///home/test/UltraSound/images/airaacolour.png"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        width: 150
        height: 150
    }
    Text {
        id: txt1
        text: qsTr("Digital Expert")
        font.pointSize: 20
        color: "white"
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // InnerRect
    Rectangle {
        id: rect1
        height: 600
        width: 500
        color: "transparent"
        x:150
        y: 160
        // Title Text

        Text {
            id: titleText
            text: qsTr("Log In")
            font.pointSize: 20
            color: "white"
            font.bold: true
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
        }
        Text {
            id: errorMessage
            text: "Email Address and Password cannot be blank"
            color: "red"
            font.bold: true
            //anchors.top: txt1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            visible: false
        }

        // Username
        TextField {
            id: usernameField
            placeholderText: qsTr("Email Address")
            color: "white"
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaUsername.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            //anchors.top: txt1.bottom
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 90
            width: 300
            height: 50

            MouseArea {
                id: hoverAreaUsername
                anchors.fill: parent
                hoverEnabled: true
                onClicked: usernameField.forceActiveFocus()
            }
        }

        // Password
        TextField {
            id: passwordField
            placeholderText: qsTr("Password")
            color: "white"
            echoMode: TextInput.Password
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaPassword.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: usernameField.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 40
            width: 300
            height: 50

            MouseArea {
                id: hoverAreaPassword
                anchors.fill: parent
                hoverEnabled: true
                onClicked: passwordField.forceActiveFocus()
            }
        }

        RowLayout {
            anchors.top: passwordField.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: passwordField.width
            spacing: 0

            // Remember Me
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 5
                CheckBox {
                    id: checkID
                }
                Text {
                    id: txtID
                    text: qsTr("Remember Me")
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
            }

            // Forgot Password
            Text {
                id: forgotPasswordText
                text: qsTr("Forgot Password?")
                color: "lightblue"
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("Forgot Password? clicked")
                    }
                }
            }
        }

        // Sign In Button
        Button {
            id: signBtn
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: -250
            width: 300
            height: 50
            background: Rectangle {
                id: buttonBackground
                color: hoverArea.containsMouse ? "#6B00E6" : "#7F00FF"
                radius: 5
                opacity: hoverArea.containsMouse ? 0.9 : 1.0
            }
            Text {
                id: btnText
                text: qsTr("LOG IN")
                color: "white"
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea {
                id: hoverArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (usernameField.text !== "" && passwordField.text !== "") {
                        dbManager.login(usernameField.text, passwordField.text);
                    } else {
                        showMessage("Email Address and Password cannot be blank", "red")
                    }
                }
            }
        }

        Timer {
            id: delayTimer
            interval: 3000
            running: false
            repeat: false
            onTriggered: {
                homepageLoader.source = "employee_op.qml";
            }
        }

        // Footer Section
        Column {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 80
            spacing: 10
            padding: 20

            Text {
                text: qsTr("@2024 AIRAA CORPORATES LLP All Rights Reserved.")
                color: "white"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
            }

            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                // Privacy Policy
                Text {
                    text: qsTr("PRIVACY POLICY")
                    color: "lightblue"
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Privacy Policy clicked")
                        }
                    }
                }

                // Terms and Conditions
                Text {
                    text: qsTr("TERMS AND CONDITIONS")
                    color: "lightblue"
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Terms and Conditions clicked")
                        }
                    }
                }
            }
        }
    }

    Timer {
        id: clearFieldsTimer
        interval: 5000
        running: false
        repeat: false
        onTriggered: {
            errorMessage.visible = false;
            usernameField.text = "";
            passwordField.text = "";
        }
    }

    function showMessage(msg, color) {
        errorMessage.text = msg;
        errorMessage.color = color;
        errorMessage.visible = true;

        clearFieldsTimer.start();
    }

    Loader {
        id: homepageLoader
        anchors.fill: parent
        visible: true

        onLoaded: {
            if (formLoader.item) {
                formLoader.item.backToLogin.connect(handleEmployeeLogout);
            }
        }
        onSourceChanged: {
            mainContent.visible = !formLoader.visible;
        }
    }

    function handleEmployeeLogout() {
        formLoader.visible = false;
        mainContent.visible = true;
    }

    Connections {
        target: dbManager
        onLoginSuccessful: function(success) {
            if (success) {
                showMessage("Login Successful!", "green")
                delayTimer.start()
            } else {
                showMessage("Invalid credentials. Please try again.", "red")
            }
        }
    }
}
