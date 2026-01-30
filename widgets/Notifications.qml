import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets
import "widgetElements"

Rectangle {
    id: root
    function setOpacity(color: color, desiredAlpha: real) {
        return Qt.rgba(color.r,color.g,color.b,desiredAlpha)
    }
    width: 256
    height: 160
    radius: config.defaultRadius * 1.5
    color: setOpacity(colors.surface_container, 0.7)

    Rectangle {
        id: notif
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 8
        radius: config.defaultRadius
        height: 32
        width: root.width - config.containerPadding
        color: setOpacity(colors.surface_container_highest, 0.6)
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            font.family: config.sysFont
            font.pixelSize: 12
            color: colors.primary_fixed
            font.weight: 500
            text: 'Notifications'
        }
    }
    Rectangle {
        color: setOpacity(colors.surface_container_high, 0.6)
        radius: config.defaultRadius
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: notif.bottom
        anchors.topMargin: config.containerPadding / 1.5
        width: root.width - config.containerPadding
        height: root.height - notif.height - (config.containerPadding * 2)
    }

}