import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
Repeater {
    model: Mpris.players
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color.r: colors.surface_container.r
        color.g: colors.surface_container.g
        color.b: colors.surface_container.b
        color.a: 0.7
        implicitHeight: musicHolder.height + 16
        implicitWidth: musicHolder.implicitWidth + 16
        radius: config.defaultRadius * 1.5
        Behavior on implicitWidth {
            NumberAnimation {
                duration: 100
                easing: Easing.OutQuad
            }
        }
        ColumnLayout {
            id: musicHolder
            spacing: config.defaultSpacing
            anchors.centerIn: parent
        Repeater {
            model: Mpris.players
            Rectangle {
                color.r: colors.surface_container_high.r
                color.g: colors.surface_container_high.g
                color.b: colors.surface_container_high.b
                color.a: 0.6
                radius: config.defaultRadius
                anchors.horizontalCenter: parent.horizontalCenter
                id: mpris
                required property var modelData
                implicitHeight: textHolder.height + 8
                implicitWidth: textHolder.width + 16
                ColumnLayout {
                    id: textHolder
                    anchors.centerIn: parent
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: config.sysFont
                        font.pixelSize: 18
                        font.variableAxes: {
                            "wdth": 200,
                            "ROND": 150,
                            "wght": 900
                        }
                        color: colors.primary_fixed
                        text: mpris.modelData.trackArtist
                    }
                    Text {
                        color: colors.primary
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: config.sysFont
                        font.variableAxes: {
                            "wdth": 100,
                            "ROND": 150,
                            "wght": 900
                        }
                        font.pixelSize: 14
                        text: mpris.modelData.trackTitle
                    }
                }
            }
            }
            Repeater {
                model: Mpris.players
                ClippingRectangle {
                    id: imageHost
                    required property var modelData
                    anchors.horizontalCenter: parent.horizontalCenter
                    implicitHeight: 128
                    implicitWidth: 128
                    color: 'transparent'
                    border.color: colors.surface_container_highest
                    border.width: 2
                    radius: config.defaultRadius
                    Image {
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectCrop
                        source: imageHost.modelData.trackArtUrl
                    }
                }
            }
            Repeater {
                model: Mpris.players
            RowLayout {
                required property var modelData
                id: musicControls
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    implicitHeight: 32
                    implicitWidth: 32
                    topLeftRadius: config.defaultRadius * 2
                    bottomLeftRadius: config.defaultRadius * 2
                    topRightRadius: config.defaultRadius
                    bottomRightRadius: config.defaultRadius
                    color: colors.secondary_container
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            musicControls.modelData.previous();
                        }
                    }    
                    Text {
                        text: "󰒮"
                        x: parent.width - width - 10
                        font.pixelSize: 24
                        color: colors.secondary
                    }
                                         
                }
                Rectangle {
                    implicitHeight: 48
                    implicitWidth: 48
                    radius: config.defaultRadius * 2
                    color: colors.primary
                    Text {
                        text: ""
                        font.pixelSize: 24
                        x: parent.width - width - 14
                        y: parent.height - height - 8
                        color: colors.primary_container
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            musicControls.modelData.togglePlaying()
                        }
                    }
                }
                Rectangle {
                    implicitHeight: 32
                    implicitWidth: 32
                    topLeftRadius: config.defaultRadius
                    bottomLeftRadius: config.defaultRadius
                    topRightRadius: config.defaultRadius * 2
                    bottomRightRadius: config.defaultRadius * 2
                    color: colors.secondary_container
                    Text {
                        text: "󰒭"
                        x: parent.width - width - 10
                        font.pixelSize: 24
                        color: colors.secondary
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            musicControls.modelData.next()
                        }
                    }
                }
            }
            }
        }

    }
}