import Quickshell
import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets
import "root:utils"
RowLayout {
    spacing: config.defaultSpacing
    ClippingRectangle {
        id: mem
        property int memPercent: 0
        implicitHeight: 100
        implicitWidth: 24
        topLeftRadius: config.defaultRadius
        topRightRadius: config.defaultRadius
        color.r : colors.surface_container_highest.r
        color.g : colors.surface_container_highest.g
        color.b : colors.surface_container_highest.b
        color.a: 0.7

        Rectangle {
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            color: colors.primary
            implicitHeight: System.cpu
            implicitWidth: parent.width
            topLeftRadius: config.defaultRadius
            topRightRadius: config.defaultRadius

            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 2
                color: colors.on_primary
                opacity: 0.25
            }

            Behavior on implicitHeight {
                NumberAnimation {
                    duration: 20
                    easing: Easing.OutQuad
                }
            }
            }                
        }
    
    ClippingRectangle {
        id: cpu
        property int cpuPercent: 0
        implicitHeight: 100
        implicitWidth: 24
        topLeftRadius: config.defaultRadius
        topRightRadius: config.defaultRadius
        color.r : colors.surface_container_highest.r
        color.g : colors.surface_container_highest.g
        color.b : colors.surface_container_highest.b
        color.a: 0.7
        Rectangle {
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            color: colors.secondary
            implicitHeight: System.mem
            implicitWidth: parent.width
            topLeftRadius: config.defaultRadius
            topRightRadius: config.defaultRadius

            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                radius: parent.radius
                implicitHeight: 2
                color: colors.on_secondary
                opacity: 0.25
            }

            Behavior on implicitHeight {
                NumberAnimation {
                    duration: 20
                    easing: Easing.OutQuad
                }
            }
    }

            }
    ClippingRectangle {
            id: battery
            implicitHeight: 100
            implicitWidth: 24
            color.r : colors.surface_container_highest.r
            color.g : colors.surface_container_highest.g
            color.b : colors.surface_container_highest.b
            color.a: 0.7
            topLeftRadius: config.defaultRadius
            topRightRadius: config.defaultRadius
            
            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                color: colors.tertiary
                implicitWidth: parent.width
                implicitHeight: System.bat
                topLeftRadius: config.defaultRadius
                topRightRadius: config.defaultRadius

            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 2
                color: colors.on_tertiary
                opacity: 0.25
            }

                Behavior on implicitHeight {
                    NumberAnimation {
                        duration: 20
                        easing: Easing.OutQuad
                    }
                }
            }

        }
}
