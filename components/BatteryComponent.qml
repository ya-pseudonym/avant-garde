import Quickshell
import QtQuick
import Quickshell.Io
import "root:utils"
Rectangle {
    implicitHeight: 24
    implicitWidth: batteryLabel.width + config.containerPadding
    color: Qt.rgba(colors.surface_container_lowest,colors.surface_container_lowest,colors.surface_container_lowest,0.5)
    radius: config.defaultRadius


    Text {
        anchors.centerIn: parent
        property string percentage: "0"
        id: batteryLabel
        text: `${getIcon(System.bat)} ${System.bat}%`
        font.family: config.sysFont
        font.pixelSize: 12
        font.variableAxes: {
            "wght": 700
        }
        font.features: {
                "tnum": true
            }
        color: colors.secondary

        function getIcon(percentStr) {
            let val = parseInt(percentStr);

            if (val >= 75) return " "
            if (val >= 50) return " "
            if (val >= 25) return " "
            if (val >= 15) return " "
            return " "
        }

    }

    Process {
        running: true
		id: battery
		command: ["sh", "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'"]
		stdout: StdioCollector {
			onStreamFinished: {
				batteryLabel.percentage = this.data;
                        }
                    }
    }					
    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: {
            battery.running = true;
        }
    }
}