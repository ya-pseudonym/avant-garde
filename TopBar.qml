import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Wayland
import "components"
Scope {
    id: root
    property real dashWidth
    property bool isDash: false
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: window
            required property var modelData
	        screen: modelData
            WlrLayershell.namespace: 'ag-bar'
            implicitHeight: 32
            implicitWidth: screen.width
            color: "transparent"
            anchors {
                top: true
                	}
                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 4
                    id: leftHolder
                    spacing: config.defaultSpacing
                    anchors.verticalCenter: parent.verticalCenter
                    ClockComponent{}
                    BatteryComponent{}
                }
                Row {
                    anchors.centerIn: parent
                    HyprlandComponent{
                    }
                }
                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    id: rightHolder
                    spacing: config.defaultSpacing
                    anchors.verticalCenter: parent.verticalCenter
                    SysComponent{}
                    MusicComponent{}

                }
            }
	
        }

    }
