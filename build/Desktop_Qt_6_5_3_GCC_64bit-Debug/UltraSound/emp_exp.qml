import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs

Item {
    visible: true
    width: 1024
    height: 768

    signal backToLogin();

    RowLayout {
        id: mainContent
        x:150
        y: 160
        spacing: 20

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            RowLayout {
                spacing: 10
                Label {
                    text: "Employee ID:"
                    Layout.alignment: Qt.AlignLeft
                    color: "white"
                }
                TextField {
                    id: employeeIdField
                    placeholderText: "Enter Employee ID"
                    height: 50
                    width: 500
                }
            }

            RowLayout {
                spacing: 10
                id: datealign
                Label {
                    text: "Expense Date:"
                    Layout.alignment: Qt.AlignLeft
                    color: "white"
                }
                RowLayout {
                    spacing: 5
                    SpinBox {
                        id: daySpin
                        from: 1
                        to: 31
                        value: 1
                        width: 50
                    }
                    SpinBox {
                        id: monthSpin
                        from: 1
                        to: 12
                        value: 1
                        width: 50
                    }
                    SpinBox {
                        id: yearSpin
                        from: 2000
                        to: 2100
                        value: 2024
                        width: 80
                    }
                }
            }

            RowLayout {
                spacing: 10
                Label {
                    text: "Amount:"
                    Layout.alignment: Qt.AlignLeft
                    color: "white"
                }
                TextField {
                    id: amountField
                    placeholderText: "Enter Amount"
                    validator: DoubleValidator { bottom: 0 }
                    height: 50
                    width: 500
                }
            }

            // Description Field
            RowLayout {
                spacing: 10
                Label {
                    text: "Description:"
                    Layout.alignment: Qt.AlignLeft
                    color: "white"
                }
                TextField{
                    id: descriptionField
                    placeholderText: "Enter Description"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    width: 500
                }
            }

            Button {
                text: "Submit Expense"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                width: 150
                onClicked: {
                    var expenseDate = yearSpin.value + "-" + monthSpin.value.toString().padStart(2, "0") + "-" + daySpin.value.toString().padStart(2, "0");
                    var amount = Number(amountField.text);

                    if (employeeIdField.text !== "" && amountField.text !== "" && descriptionField.text !== "") {
                        dbManager.createExpense(employeeIdField.text, expenseDate, amount, descriptionField.text);
                        messageDialog.title = "Success";
                        messageDialog.text = "Successfully submitted your record!";
                        messageDialog.visible = true;
                        mainContent.visible = false;
                    } else {
                        messageDialog.title = "Error";
                        messageDialog.text = "Please fill all fields before submitting.";
                        messageDialog.visible = true;
                    }
                }
            }
            Button{
                id: logID
                text:"LogOut"
                onClicked: {
                   backToLogin();
                }
            }
        }
    }

    Loader{
        id: employeeLoader
    }

    MessageDialog {
        id: messageDialog
        Layout.alignment: Qt.AlignTop
    }

    Connections{
        target: dbManager
    }
}
