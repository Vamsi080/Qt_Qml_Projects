import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: homepageID
    anchors.fill: parent

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        visible: false
        width: 100
        height: 100
    }

    Timer {
        id: timer
        interval: 5000
        running: false
        repeat: false
        onTriggered: {
            busyIndicator.visible = false
        }
    }

    Component.onCompleted: {
        busyIndicator.visible = true
        timer.start()
    }
}
