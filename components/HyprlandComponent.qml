import Quickshell
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts

Rectangle {
    function setOpacity(color: color, desiredAlpha: real) {
        return Qt.rgba(color.r, color.g, color.b, desiredAlpha)
    }
    id: root
    implicitHeight: 24
    implicitWidth: holder.width + config.containerPadding
    color: setOpacity(colors.surface_container_lowest, 0.6)
    radius: config.defaultRadius
    Behavior on implicitWidth {
        NumberAnimation {
            duration: 100
            easing: Easing.OutQuad
        }
    }
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        id: holder
        spacing: config.defaultSpacing / 2
        Repeater {
            id: repeater
            model: Hyprland.workspaces
            Rectangle {
                color: 'transparent'
                implicitWidth: workspace.isActive? 36 : 24
                implicitHeight: 18
                Rectangle {
                    id: workspace
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                    color: isActive? colors.primary : colors.on_primary_fixed
                    radius: isActive? config.defaultRadius : config.defaultRadius / 1.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    implicitHeight: 12
                    implicitWidth: isActive? 32 : 16
                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                            easing: Easing.OutQuad
                        }
                    }
                    Behavior on implicitWidth {
                        NumberAnimation {
                            duration: 100
                            easing: Easing.OutQuad
                        }
                    }
                }
            }
        }
    }

}