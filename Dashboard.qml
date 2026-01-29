import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import "widgets"
Scope {
    id: root
    property bool shouldShow
    LazyLoader {
        active: root.shouldShow
        PanelWindow {
            id: dash
            WlrLayershell.namespace: 'ag-dash'
            anchors.top: true
            exclusiveZone: 0
            implicitHeight: contentHolder.height + config.containerPadding
            implicitWidth: contentHolder.width + config.containerPadding
            color: 'transparent'
            Rectangle {
                id: dashboardBack
                color: Qt.rgba(colors.surface_container_lowest,colors.surface_container_lowest,colors.surface_container_lowest,0.5)
                anchors.fill: parent
                radius: config.defaultRadius * 2

                Row {
                    anchors.centerIn: parent
                    id: contentHolder
                    spacing: config.defaultSpacing
                    ColumnLayout {
                        spacing: config.defaultSpacing
                        ColumnLayout {
                        SysWidget{}
                        PowerMenu{
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        //Notifications{}
                        }
                    }
                    MprisWidget{}
                }
            }
        }
    }
}