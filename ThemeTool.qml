import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root
    property string themeName: "default"
    property string themeFont: jsonData.font
    property real themeRadius: jsonData.radius
    onThemeRadiusChanged: {
        oldRadius = themeRadius;
    }
    property real themePadding: jsonData.padding
    onThemePaddingChanged: {
        oldPadding = themePadding;
    }
    property real themeSpacing: jsonData.spacing
    onThemeSpacingChanged: {
        oldSpacing = themeSpacing;
    }

    property real oldRadius: themeRadius
    property real oldPadding: themePadding
    property real oldSpacing: themeSpacing

    Behavior on themeRadius {
        NumberAnimation {
            duration: 50
            easing.type: Easing.Bezier
            easing.bezierCurve: [1, -.5, 1.2, 1.3]   // smooth bezier
        }
    }
    Behavior on themePadding {
        NumberAnimation {
            duration: 25
            easing.type: Easing.Bezier
            easing.bezierCurve: [1, -.5, 1.2, 1.3]   // smooth bezier
        }
    }
    Behavior on themeSpacing {
        NumberAnimation {
            duration: 25
            easing.type: Easing.Bezier
            easing.bezierCurve: [1, -0.06, 1.2, 1.3]   // smooth bezier
        }
    }



    FileView {
        id: jsonFile
        watchChanges: true
        path: Qt.resolvedUrl(`root:/themes/${themeName}.json`)
        blockLoading: true
        onFileChanged: {
            this.reload();
        }
    }
    property var jsonData: JSON.parse(jsonFile.text())

}