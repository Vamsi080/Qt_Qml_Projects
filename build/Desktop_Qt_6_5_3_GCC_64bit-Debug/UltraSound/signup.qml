import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    width: 640
    height: 480
    visible: true

    signal signupSuccessful()
    signal backToDashboard()

    Image {
        id: bgIMG
        source: "file:///home/test/UltraSound/images/abstract-digital-technology-background-with-concept-security-vector.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

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

    // Main Rectangle
    Rectangle {
        id: rect1
        height: 750
        width: 500
        color: "transparent"
        x:150
        y: 160

        Text {
            id: titleText
            text: qsTr("Sign Up")
            font.pointSize: 20
            color: "white"
            font.bold: true
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
        }

        // Error Message
        Text {
            id: messageText
            text: ""
            color: "green"
            font.bold: true
            anchors.top: titleText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            visible: false
        }

        // Employee ID Field
        TextField {
            id: employeeId
            placeholderText: qsTr("Employee ID")
            color: "white"
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaEmployee.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: titleText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: 300
            height: 50

            // Check for numeric input
            onTextChanged: {
                // Update the visibility of the error message
                errorMessage.visible = !/^\d*$/.test(employeeId.text) && employeeId.text.length > 0;
                // Remove non-numeric characters if numeric input is detected
                if (/^\d*$/.test(employeeId.text)) {
                    errorMessage.visible = false;
                } else {
                    employeeId.text = employeeId.text.replace(/\D/g, ''); // Remove non-numeric characters
                }
            }

            MouseArea {
                id: hoverAreaEmployee
                anchors.fill: parent
                hoverEnabled: true
                onClicked: employeeId.forceActiveFocus()
            }
        }

        Text {
            id: errorMessage
            text: qsTr("ID should be in numerics")
            color: "red"
            anchors.top: employeeId.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 5
            visible: false // Initially hidden
        }

        // Username Field
        TextField {
            id: userNameId
            placeholderText: qsTr("UserName")
            color: "white"
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreauserName.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: employeeId.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: 300
            height: 50

            MouseArea {
                id: hoverAreauserName
                anchors.fill: parent
                hoverEnabled: true
                onClicked: userNameId.forceActiveFocus()
            }
        }

        // Email Address Field
        TextField {
            id: signupUsername
            placeholderText: qsTr("Email Address")
            color: "white"
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaUsername.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: userNameId.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: 300
            height: 50

            MouseArea {
                id: hoverAreaUsername
                anchors.fill: parent
                hoverEnabled: true
                onClicked: signupUsername.forceActiveFocus()
            }
        }

        // Password Field
        TextField {
            id: signupPassword
            placeholderText: qsTr("Password")
            color: "white"
            echoMode: TextInput.Password
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaPassword.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: signupUsername.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: 300
            height: 50

            MouseArea {
                id: hoverAreaPassword
                anchors.fill: parent
                hoverEnabled: true
                onClicked: signupPassword.forceActiveFocus()
            }
        }

        // Phone Number Field
        TextField {
            id: phoneNumber
            placeholderText: qsTr("Phone No")
            color: "white"
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaPhone.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: signupPassword.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: 300
            height: 50

            MouseArea {
                id: hoverAreaPhone
                anchors.fill: parent
                hoverEnabled: true
                onClicked: phoneNumber.forceActiveFocus()
            }
        }

        // Gender Field
        TextField {
            id: genderId
            placeholderText: qsTr("Gender")
            color: "white"
            background: Rectangle {
                color: "darkgrey"
                border.color: hoverAreaGender.containsMouse ? "blue" : "transparent"
                border.width: 2
            }
            anchors.top: phoneNumber.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            width: 300
            height: 50

            MouseArea {
                id: hoverAreaGender
                anchors.fill: parent
                hoverEnabled: true
                onClicked: genderId.forceActiveFocus()
            }
        }

        // Sign Up Button
        Button {
            id: signUpBtn
            text: qsTr("SIGN UP")
            anchors.top: genderId.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 40
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
                text: qsTr("SIGN UP")
                color: "white"
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea {
                id: hoverArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (employeeId.text !== "" && userNameId.text !== "" && signupUsername.text !== "" && signupPassword.text !== "" && phoneNumber.text !== "" && genderId.text !== "") {
                        messageText.text = "Successfully registered!";
                        messageText.color = "green";
                        messageText.visible = true;
                        errorMessageTimer.start();

                        // Call the database function to create an employee
                        dbManager.createEmployee(employeeId.text, userNameId.text, signupUsername.text, signupPassword.text, phoneNumber.text, genderId.text);
                        signupSuccessful();
                    } else {
                        messageText.text = "Please fill in all fields correctly.";
                        messageText.color = "red";
                        messageText.visible = true;
                        errorMessageTimer.start();
                    }
                }
            }
        }
    }

    //Clear the fileds after success or failed senario
    Timer {
        id: errorMessageTimer
        interval: 5000
        repeat: false
        onTriggered: {
            messageText.visible = false;
            employeeId.text = "";
            userNameId.text = "";
            signupUsername.text = "";
            signupPassword.text = "";
            phoneNumber.text = "";
            genderId.text = "";
        }
    }

    // Footer Section
    Column {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30
        spacing: 10

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

    Connections {
        target: dbManager
    }
}
