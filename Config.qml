import QtQuick
import Quickshell
QtObject {


    property string sysFont:               "Google Sans Flex"
    property int defaultSpacing:            8
    property int transitionDuration:        200
    property int containerPadding:          16
    property int defaultRadius:             8

    Behavior on defaultRadius {
        NumberAnimation {
            duration: transitionDuration
            easing: Easing.OutQuad
        }
    }

    Behavior on defaultSpacing {
        NumberAnimation {
            duration: transitionDuration
            easing: Easing.OutQuad
        }
    }

    Behavior on containerPadding {
        NumberAnimation {
            duration: transitionDuration
            easing: Easing.OutQuad
        }
    }
}