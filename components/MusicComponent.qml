import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris

Repeater {
    model: Mpris.players
Rectangle {
    id: root 
    required property var modelData
    implicitHeight: 24
    implicitWidth: playerHolder.width + config.containerPadding
    radius: config.defaultRadius
    color: Qt.rgba(colors.surface_container_lowest,colors.surface_container_lowest,colors.surface_container_lowest,0.5)

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("clicked");
            musicWidget.shouldShow = !musicWidget.shouldShow;
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 100
            easing: Easing.OutQuad
        }
    }
    RowLayout {
        id: playerHolder
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        spacing: config.defaultSpacing
    Text {
        anchors.verticalCenter: parent.verticalCenter
        id: playerSong
        color: colors.secondary
        font.family: config.sysFont
        font.pixelSize: 12
        font.variableAxes: {
            "wght": 700,
            "wdth": 90
        }
        text: `${root.modelData.trackTitle}`
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        color: colors.primary
        font.family: config.sysFont
        font.pixelSize: 12
        font.bold: true
        text: '-'
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        id: playerArtist
        color: colors.tertiary
        font.family: config.sysFont
        font.pixelSize: 12
        font.variableAxes: {
            "wght": 700,
            "wdth": 90        
            }
        text: `${root.modelData.trackArtist}`
    }
    }
    }
}
