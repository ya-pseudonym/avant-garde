import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: root

	// Bind the pipewire node so its volume will be tracked
	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	Connections {
		target: Pipewire.defaultAudioSink?.audio

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}

	property bool shouldShowOsd: false

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	// The OSD window will be created and destroyed based on shouldShowOsd.
	// PanelWindow.visible could be set instead of using a loader, but using
	// a loader will reduce the memory overhead when the window isn't open.
	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			// Since the panel's screen is unset, it will be picked by the compositor
			// when the window is created. Most compositors pick the current active monitor.

			anchors.top: true
			// margins.top: screen.height / 5
			exclusiveZone: 0

			implicitWidth: 256
			implicitHeight: 32
			color: "transparent"

			// An empty click mask prevents the window from blocking mouse events.
			mask: Region {}

			Rectangle {
				anchors.fill: parent
				radius: config.defaultRadius * 1.5
				color: colors.surface_container_lowest
				RowLayout {
					anchors {
						fill: parent
						leftMargin: 16
						rightMargin: 16
					}
                    Text {
                        text: Pipewire.defaultAudioSink?.audio.muted ? "Muted" : "Volume:"
						font.variableAxes: {
							"wght": 800
						}
                        color: colors.primary
                        font.family: config.sysFont
                        font.pixelSize: 14
						Behavior on x {
							NumberAnimation {
								duration: 75
								easing: Easing.OutQuad
							}
						}
                    }
					Rectangle {
						// Stretches to fill all left-over space
						Layout.fillWidth: true
						implicitHeight: 10 
						radius: config.defaultRadius
						color: colors.on_primary_fixed
						Behavior on x {
							NumberAnimation {
								duration: 75
								easing: Easing.OutQuad
							}
						}
						Rectangle {
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}
							
                            color: Pipewire.defaultAudioSink?.audio.muted ? colors.primary_container : colors.primary
							implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
							radius: parent.radius

                            Behavior on implicitWidth {
                                NumberAnimation {
                                    duration: 75
                                    easing: Easing.OutQuad
                                }
                            }

						}
					}
				}
			}
		}
	}
}
