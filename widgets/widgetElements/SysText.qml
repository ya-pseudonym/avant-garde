import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:utils"
Row {
    id: root
    spacing: config.defaultSpacing
    Rectangle {
        width: 24
        height: 28
        color: colors.primary
        bottomLeftRadius: config.defaultRadius
        bottomRightRadius: config.defaultRadius
        Text {
            font.variableAxes: {
                "wght": 700
            }
            font.features: {
                "tnum": true
		    }
            font.family: config.sysFont
            color: colors.surface_container
            text: `${System.cpu}%`
            font.pixelSize: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            x: 5.5
            y: parent.height - 16
            text: ''
            color: colors.surface_container
        }
    }
    Rectangle {
        width: 24
        height: 28
        color: colors.secondary
        bottomLeftRadius: config.defaultRadius
        bottomRightRadius: config.defaultRadius
        Text {
            font.variableAxes: {
                "wght": 700
            }
            font.features: {
                "tnum": true
		    }
            font.family: config.sysFont
            color: colors.surface_container
            text: `${System.mem}%`
            font.pixelSize: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            x: 5.5
            y: parent.height - 16
            text: ''
            color: colors.surface_container
        }
    }
    Rectangle {
    width: 24
    height: 28
    color: colors.tertiary
    bottomLeftRadius: config.defaultRadius
    bottomRightRadius: config.defaultRadius
    Text {
        font.variableAxes: {
            "wght": 700
        }
		font.features: {
                "tnum": true
		}
        font.family: config.sysFont
        color: colors.surface_container
        text: `${System.bat}%`
        font.pixelSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        function getIcon(percentStr) {
            let val = parseInt(percentStr);

            if (val >= 75) return " "
            if (val >= 50) return " "
            if (val >= 25) return " "
            if (val >= 15) return " "
            return " "
        }
        x: 6
        y: parent.height - 16
        text: `${getIcon(System.bat)}`
        color: colors.surface_container
    }
}
}