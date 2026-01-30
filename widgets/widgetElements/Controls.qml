import Quickshell.Services.Mpris
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import QtQuick.Effects
                Repeater {
                    model: Mpris.players
                
            Rectangle {
                id: controls
                height: 32
                required property var modelData
                anchors.horizontalCenter: parent.horizontalCenter
                color: root.setOpacity(colors.surface_container_highest, 0.6)
                radius: config.defaultRadius * 1.5
                width: parent.width - config.containerPadding
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: controls.left
                    anchors.leftMargin: config.containerPadding / 2
                    color: colors.secondary
                    radius: config.defaultRadius
                    implicitHeight: 24
                    implicitWidth: 48
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: parent.width / 2 - width / 2
                        font.pointSize: 18
                        color: colors.secondary_container
                        text: "󰒮"
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            modelData.previous()
                        }
                    }
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: colors.primary
                    implicitHeight: 24
                    implicitWidth: 48
                    radius: config.defaultRadius
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: parent.width / 2 - width / 2
                        font.pointSize: 12
                        text: ''
                        color: colors.primary_container
                    }
                }
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    color: colors.secondary
                    anchors.right: controls.right
                    anchors.rightMargin: config.containerPadding / 2
                    radius: config.defaultRadius
                    implicitHeight: 24
                    implicitWidth: 48
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        x: parent.width / 2 - width / 2
                        font.pointSize: 18
                        color: colors.secondary_container
                        text: "󰒭"
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            modelData.next()
                        }
                    }
                }
            }
                }