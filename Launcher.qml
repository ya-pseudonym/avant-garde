import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Wayland
import "utils/fuzzySort.js" as FuzzySort
Scope {
    id: root
    property bool shouldShow: false
    function setOpacity(color:color, desiredAlpha:real) {
        return Qt.rgba(color.r,color.g,color.b,desiredAlpha)
    }
    LazyLoader {
        active: root.shouldShow
        PanelWindow {
            WlrLayershell.namespace: 'ag-dash'
            implicitHeight: screen.height
            implicitWidth: screen.width
            color: 'transparent'
            focusable: true
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.shouldShow = false;
                }
            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.topMargin: 16
                implicitHeight: 256 - 32
                implicitWidth: 512
                color: config.opaque ? colors.surface_container_lowest : root.setOpacity(colors.surface_container_lowest, 0.7)
                radius: config.defaultRadius * 2
                border.color: colors.surface_container_highest
                border.width: 2

                Rectangle {
                    implicitHeight: parent.height - config.containerPadding
                    implicitWidth: parent.width - config.containerPadding
                    anchors.centerIn: parent
                    radius: config.defaultRadius * 1.5
                    color.r: colors.surface_container.r
                    color.g: colors.surface_container.g
                    color.b: colors.surface_container.b
                    color.a: 0.25
                    ColumnLayout {
                        id: columnHolder
                        width: parent.width
                        height: parent.height
                        spacing: config.defaultSpacing
                        anchors.top: parent.top
                        Rectangle {
                            id: search
                            anchors.top: parent.top
                            anchors.topMargin: 8
                            implicitHeight: 38
                            radius: config.defaultRadius
                            implicitWidth: parent.width - config.containerPadding
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: root.setOpacity(colors.surface_container_highest, 0.7)
                            TextInput {
                                id: entry
                                focus: true
                                anchors.verticalCenter: parent.verticalCenter
                                font.family: config.sysFont
                                font.pixelSize: 16
                                font.variableAxes: {
                                    "wght": 700,
                                    "ROND": 100
                                }
                                color: colors.primary
                                x: 8
                                property bool notSearching: text.length === 0
                                property string content: entry.text
                                property var current: appView.currentIndex
                                onTextChanged: appView.forceLayout()
                                Keys.onReturnPressed: {
                                    const list = appView.model;
                                    if (!notSearching) {
                                    console.log(list);
                                    if (list.length > 0) {
                                        list[current].execute();
                                        root.shouldShow = false;
                                    }}
                                    if (notSearching) {
                                        list[current].execute()
                                        root.shouldShow = false;
                                    }
                                }
                                Keys.onDownPressed: {
                                    appView.incrementCurrentIndex()
                                }
                                Keys.onUpPressed: {
                                    appView.decrementCurrentIndex()
                                }
                                Keys.onEscapePressed: root.shouldShow = false
                                Text {
                                    font.family: config.sysFont
                                    color: root.setOpacity(colors.primary, 0.6)
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: 'Search for something..'
                                    font.variableAxes: {
                                        "wght": 600
                                    }
                                    visible: entry.notSearching
                                }
                            }
                        }
                        Rectangle {
                            id: appList
                            anchors.top: search.bottom
                            anchors.topMargin: 8
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: appView.bottom
                            anchors.bottomMargin: 8
                            implicitHeight: appView.height + config.containerPadding
                            radius: config.defaultRadius
                            color: root.setOpacity(colors.surface_container_high, 0.5)
                            implicitWidth: parent.width - config.containerPadding

                            ListView {

                                focus: true
                                id: appView
                                width: parent.width - 16
                                height: 128
                                model: entry.searching?  DesktopEntries.applications : FuzzySort.go(entry.text, DesktopEntries.applications.values, {
                                    all: true,
                                    keys: ["name","genericName"]
                                }).map(a => a.obj)
                                y: 8
                                spacing: 8
                                anchors.horizontalCenter: parent.horizontalCenter
                                clip: true

                                function launchModelData(): void {
                                    if (currentItem && currentItem.modelData) {
                                        currentItem.modelData.execute()
                                        root.shouldShow = false;
                                    }
                                }

                                delegate: Rectangle {
                                    id: delegated
                                    property bool isSelected: ListView.isCurrentItem
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    width: parent.width
                                    height: 32
                                    color: root.setOpacity(colors.surface_container_highest, 0.6)
                                    radius: config.defaultRadius / 1.5

                                    states: [
                                        State {
                                            name: "selected"
                                            when: delegated.isSelected

                                            PropertyChanges {
                                                target: delegated
                                                color: colors.primary
                                            }
                                            PropertyChanges {
                                                target: name 
                                                color: colors.surface_container_highest
                                                weight: 900
                                                textWidth: 120
                                            }
                                            PropertyChanges {
                                                target: desc
                                                color: colors.surface_container_highest
                                                weight: 500
                                                textWidth: 120

                                            }

                                        }
                                    ]

                                    transitions: [
                                        Transition {
                                            from: ""; to: "selected"
                                            reversible: true
                                            ColorAnimation {
                                                properties: "color"; duration: 300; easing.type: Easing.OutQuad;
                                            }
                                            NumberAnimation {
                                                properties: "weight, textWidth"; duration: 300; easing.type: Easing.OutQuad
                                            }
                                        }
                                    ]
                                        Text {
                                            id: name
                                            x: 8
                                            font.variableAxes: {
                                                "wght": weight,
                                                "wdth": textWidth
                                            }
                                            font.family: config.sysFont
                                            anchors.verticalCenter: parent.verticalCenter
                                            property int weight: 500
                                            property int textWidth: 100
                                            font.pointSize: 12
                                            text: modelData.name
                                            color: colors.primary_fixed
                                        }
                                        Text {
                                            id: desc
                                            anchors.left: name.right
                                            anchors.verticalCenter: name.verticalCenter
                                            anchors.leftMargin: 8
                                            font.family: config.sysFont
                                            color: colors.primary
                                            property int weight: 400
                                            property int textWidth: 90
                                            font.variableAxes: {
                                                "wght": weight,
                                                "wdth": textWidth
                                            }
                                            font.pointSize: 8
                                            text: modelData.comment
                                            
                                        }
                                        MouseArea {
                                            id: handler
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onClicked: {
                                                modelData.execute()
                                                root.shouldShow = false
                                            }
                                            onEntered: {
                                                appView.currentIndex = index
                                            }
                                        }

                                }

                            }
                        }
                        }
                    }

                    }

                }

            }
        
        }