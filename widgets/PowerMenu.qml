import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
Rectangle {
    id: root
    function setAlpha(color: color, preferredAlpha: real) {
        return Qt.rgba(color.r, color.g, color.b, preferredAlpha)
    }
    width: 256
    height: buttonHolder.height + config.containerPadding
    color.r: colors.surface_container.r
    color.g: colors.surface_container.g
    color.b: colors.surface_container.b
    color.a: 0.5
    radius: config.defaultRadius * 1.5
    Row {
        width: parent.width
        height: 32
        anchors.centerIn: parent
        id: buttonHolder
        spacing: config.defaultSpacing

        Rectangle {
            id: powerButton
            topLeftRadius: config.defaultRadius
            bottomLeftRadius: config.defaultRadius
            topRightRadius: config.defaultRadius / 2
            bottomRightRadius: config.defaultRadius / 2
            anchors.left: parent.left
            anchors.leftMargin: config.containerPadding / 2
            implicitHeight: 32
            implicitWidth: 84
            color: root.setAlpha(colors.surface_container_highest, 0.6)
            Behavior on color {
                ColorAnimation {
                    duration: 100
                    easing: Easing.OutQuad
                }
            }
            Text {
                id: shutdownText
                anchors.centerIn: parent
                font.family: config.sysFont
                color: colors.primary_fixed
                text: "  Shutdown"
                font.variableAxes: {
                    "wght": 700,
                    "wdth": 75
                }
                Behavior on color {
                    ColorAnimation {
                        duration: 100
                        easing: Easing.OutQuad
                    }
                }
            }
            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    powerButton.color = root.setAlpha(colors.primary, 0.8)
                    shutdownText.color = colors.surface
                }
                onExited: {
                    powerButton.color = root.setAlpha(colors.surface_container_highest, 0.6)
                    shutdownText.color = colors.primary_fixed
                }
            }
        }
        Rectangle {
            id: rebootButton
            radius: config.defaultRadius / 2
            implicitHeight: 32
            implicitWidth: 64
            anchors.left: powerButton.right
            anchors.right: logoutButton.left
            anchors.leftMargin: config.containerPadding / 2
            anchors.rightMargin: config.containerPadding / 2
            color: root.setAlpha(colors.surface_container_highest, 0.6)
            Behavior on color {
                    ColorAnimation {
                        duration: 100
                        easing: Easing.OutQuad
                    }
                }
            Text {
                id: rebootText
                font.variableAxes: {
                    "wght": 700,
                    "wdth": 75
                }
                anchors.centerIn: parent
                font.family: config.sysFont
                color: colors.secondary_fixed
                text: " Reboot"
                Behavior on color {
                    ColorAnimation {
                        duration: 100
                        easing: Easing.OutQuad
                    }
                }
            }
            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    rebootButton.color = root.setAlpha(colors.secondary, 0.8)
                    rebootText.color = colors.surface
                }
                onExited: {
                    rebootButton.color = root.setAlpha(colors.surface_container_highest, 0.6)
                    rebootText.color = colors.secondary_fixed
                }
            }
        }
        Rectangle {
            id: logoutButton
            anchors.right: parent.right
            anchors.rightMargin: config.containerPadding / 2
            topLeftRadius: config.defaultRadius / 2
            bottomLeftRadius: config.defaultRadius / 2
            topRightRadius: config.defaultRadius
            bottomRightRadius: config.defaultRadius
            implicitHeight: 32
            implicitWidth: 64
            color: root.setAlpha(colors.surface_container_highest, 0.6)
            Behavior on color {
                    ColorAnimation {
                        duration: 100
                        easing: Easing.OutQuad
                    }
                }
            Text {
                id: logoutText
                anchors.centerIn: parent
                font.family: config.sysFont
                color: colors.tertiary_fixed
                text: "󰈆 Logout"
                font.variableAxes: {
                    "wght": 700,
                    "wdth": 75
                }
            
            Behavior on color {
                ColorAnimation {
                    duration: 100
                    easing: Easing.OutQuad
                }
            }
            }
            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    logoutButton.color = root.setAlpha(colors.tertiary, 0.8)
                    logoutText.color = colors.surface
                }
                onExited: {
                    logoutButton.color = root.setAlpha(colors.surface_container_highest, 0.6)
                    logoutText.color = colors.tertiary_fixed
                }
            }
            
        }
    }
}