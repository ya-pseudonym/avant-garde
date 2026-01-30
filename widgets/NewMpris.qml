import Quickshell.Services.Mpris
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import QtQuick.Effects
import "widgetElements"
Repeater {
    model: Mpris.players
    ClippingRectangle {
        clip : true
        id: root 
        property var modelData
        function setOpacity(color:color, desiredAlpha:real) {
            return Qt.rgba(color.r,color.g,color.b,desiredAlpha)
        }

        anchors.verticalCenter: parent.verticalCenter
        height: 308
        width: 192
        radius: config.defaultRadius * 1.5
        color: setOpacity(colors.surface_container, 0.7)
        Repeater {
                model: Mpris.players
            Image {
                required property var modelData
                anchors.centerIn: parent
                source: modelData.trackArtUrl
                fillMode: Image.PreserveAspectCrop
                opacity: 0.8
                layer.enabled: true
                layer.effect: MultiEffect {
                    blurEnabled: true
                    blur: 1.2
                    brightness: -0.2
                    saturation: 0.1
                }
            }
            }
        Column {
            spacing: config.defaultSpacing
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: Mpris.players
                Row {
                    required property var modelData
                    width: root.width
                    height: trackArt.height + config.containerPadding
                    id: pic
                    anchors.horizontalCenter: parent.horizontalCenter
                ClippingRectangle {
                    id: trackArt
                    width: 160
                    height: 160
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: config.containerPadding
                    radius: config.defaultRadius
                    color: 'transparent'
                    Repeater {
                        model: Mpris.players
                    Image {
                        required property var modelData
                        anchors.fill: parent
                        source: modelData.trackArtUrl
                        fillMode: Image.PreserveAspectCrop
                    }
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                    }
                }
                }
                }
            Rectangle {
                id: status
                radius: config.defaultRadius
                anchors.bottom: root.bottom
                implicitHeight: 80
                implicitWidth: root.width - config.containerPadding
                anchors.horizontalCenter: parent.horizontalCenter
                color: setOpacity(colors.surface_container_highest, 0.6)
                Repeater {
                    model: Mpris.players
                RowLayout {
                    id: textHolder
                    required property var modelData
                    width: status.width
                    height: 32
                    function formatTime(value) {
                        // value is in ms, so scale up
                        if (value < 10_000_000) { 
                            value = value * 1000    
                        }
                        let seconds = Math.floor(value / 1000)
                        let formattedSeconds = Math.floor(seconds % 60)
                        let minutes = Math.floor((seconds % 3600) / 60)
                        return minutes + ":" + (formattedSeconds < 10 ? "0" + formattedSeconds : formattedSeconds)
                    }


                    Text {
                        anchors.top: status.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: trackArtist
                        text: modelData.trackArtist
                        color: colors.primary_fixed
                        font.family: config.sysFont
                        font.pointSize: 12
                        font.variableAxes: {
                            "wght": 800,
                            "ROND": 50,
                            "opsz": 300
                        }
                    }
                    Text {
                        id: trackName
                        anchors.top: trackArtist.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: config.sysFont
                        font.pointSize: 8
                        color: colors.primary
                        text: modelData.trackTitle
                        font.variableAxes: {
                            "wght": 600,
                            "slnt": -5,
                            "ROND": 100,
                            "opsz": 500
                        }
                    }
                    Text {
                        id: positionDuration
                        anchors.top: trackName.bottom
                        anchors.topMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: config.sysFont
                        font.pointSize: 8
                        font.variableAxes: {
                            "wght": 700,
                            "slnt": -8,
                            "ROND": 100,
                            "opsz": 500
                        }
                        color: colors.tertiary
                        property string len: modelData.length
                        property string pos: modelData.position
                        text: `${pos} / ${len}`
                    }
                    Timer {
                        interval: 100
                        running: true
                        repeat: true
                        onTriggered: {
                            positionDuration.pos = textHolder.formatTime(modelData.position)
                            positionDuration.len = textHolder.formatTime(modelData.length)

                        }
                    }
                }
                }
                Repeater {
                    model: Mpris.players
                    ClippingRectangle {
                        id: bar
                        required property var modelData
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: config.defaultRadius
                        anchors.bottom: status.bottom
                        anchors.bottomMargin: config.containerPadding / 2
                        width: status.width - config.containerPadding
                        height: 8
                        color: colors.surface_container_highest
                        Rectangle {
                            id: progress
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }
                            width: modelData.position
                            color: colors.primary
                            radius: config.defaultRadius
                            Timer {
                                interval: 100
                                running: true
                                repeat: true
                                onTriggered: progress.width = bar.width * (modelData.position / modelData.length)
                            }
                            Behavior on width {
                                NumberAnimation {
                                    duration: 100
                                }
                            }
                            Rectangle {
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: 2
                                width: 6
                                height: 6
                                radius: config.defaultRadius
                                color: colors.primary_fixed
                            }
                        }

                    }
                }
            }
                Controls{}
        }

    }
}