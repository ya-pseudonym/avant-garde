import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets

Rectangle {
                implicitHeight: 128
                implicitWidth: contentHolder.width + config.containerPadding
                color.r : colors.surface_container_highest.r
                color.g : colors.surface_container_highest.g
                color.b : colors.surface_container_highest.b
                color.a: 0.5
                radius: config.defaultRadius
                SystemClock {
                    id: clock
                    precision: SystemClock.Seconds
                }
                ColumnLayout {
                    id: contentHolder
                    spacing: config.defaultSpacing
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: greeting
                        property string user
                        text: `Hello, ${user}!`
                        font.family: config.sysFont
                        font.variableAxes: {
                            "wght": 750,
                            "ROND": 0,
                        }
                        color: colors.secondary_fixed
                        font.pixelSize: 14
                        anchors.horizontalCenter: parent.horizontalCenter
                        Process {
                            id: getUser
                            running: true
                            command: ["sh", "-c", "whoami"]
                            stdout: StdioCollector {
                                onStreamFinished: {
                                    greeting.user = this.text.replace("\n","");
                                }
                            }
                        }
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: config.sysFont
                        font.variableAxes: {
                            "ROND": 100,
                            "wght": 900,
                            "wdth": 70,

                        }
                        font.pixelSize: 32
                        color: colors.primary_fixed
                        text: Qt.formatDateTime(clock.date, "hh:mm AP")
                    }
                    Text {
                        font.family: config.sysFont
                        font.pixelSize: 14
                        font.variableAxes: {
                            "ROND": 100,
                            "wdth": 150,
                            "wght": 900,
                            "slnt": -2,
                            "GRAD": 70
                        }
                        color: colors.primary
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: Qt.formatDateTime(clock.date, "ddd, MMM dd")
                    }
                }
            }