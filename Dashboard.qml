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
        active: shouldShow
        PanelWindow {
            anchors.top: true
            WlrLayershell.layer: WlrLayer.Overlay
            exclusiveZone: 0
            WlrLayershell.namespace: 'ag-dash'
            id: dash
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
                        // SysWidget{
                        //     id: sys
                        // }
                        NewMpris{
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        //PowerMenu{
                        //     anchors.horizontalCenter: parent.horizontalCenter
                        // }
                       // Notifications{}
                        }
                    }
                    ColumnLayout {
                        spacing: config.defaultSpacing
                        SysWidget{
                            id: sys
                        }
                        Notifications{

                            width: sys.width
                        }
                    }
                    // MprisWidget{
                    //     anchors.right: parent.right
                    // }
                }
            }
        }
    }
}