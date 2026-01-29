import Quickshell
import QtQuick
import Quickshell.Io


Rectangle {
	id: root
	implicitWidth: clockText.width + config.containerPadding
	implicitHeight: 24
	radius: config.defaultRadius
	color: Qt.rgba(colors.surface_container_lowest,colors.surface_container_lowest,colors.surface_container_lowest,0.5)
	SystemClock {
		id: clock
		precision: SystemClock.Minutes
			}

	Text {
        anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter
		id: clockText
		color: colors.primary
		text: Qt.formatDateTime(clock.date, "h:mm AP")
		font.family: config.sysFont
		font.variableAxes: {
			"wght": 700
		}
		font.features: {
                "tnum": true
		}
		font.pixelSize: 12
			}
		}

