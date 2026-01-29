import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets
import "widgetElements"
Rectangle {
    color.r: colors.surface_container.r
    color.g: colors.surface_container.g
    color.b: colors.surface_container.b
    color.a: 0.7

    implicitHeight: sysWidgets.height + config.containerPadding
    implicitWidth: sysWidgets.width + config.containerPadding
    radius: config.defaultRadius * 1.5
        RowLayout {
            id: sysWidgets
            anchors.centerIn: parent
            spacing: config.defaultSpacing
            ColumnLayout {
            id: sysMetrics
            spacing: 0
            SysBars{
                id: bars
            }
            SysText{
                id: text
            }
            }
            Clock{}

        
            }
        }