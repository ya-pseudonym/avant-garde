import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import "root:utils"
Rectangle {
    implicitHeight: 24
    implicitWidth: textHolder.width + config.containerPadding
    color: Qt.rgba(colors.surface_container_lowest,colors.surface_container_lowest,colors.surface_container_lowest,0.5)
    radius: config.defaultRadius
    RowLayout {
        id: textHolder
        anchors.centerIn: parent
        spacing: config.defaultSpacing

        Text {
            font.variableAxes: {
                "wght": 700
            }
            font.features: {
                "tnum": true
            }
            property string memPercent: '0'
            id: 'memText'
            text: `  ${System.mem}%`
            font.family: config.sysFont
            color: colors.primary
            font.pixelSize: 12
        }
        Text {
            property string cpuPercent: '0'
            id: 'cpuText'
            text: `  ${System.cpu}%`
            font.family: config.sysFont
            color: colors.tertiary
            font.pixelSize: 12
            font.variableAxes: {
                "wght": 700
            }
            font.features: {
                "tnum": true
            }
        }
    }
}