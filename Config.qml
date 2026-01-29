import QtQuick
import Quickshell
import Quickshell.Io
import "utils"

QtObject {
    property string themeFont: theme.themeFont
    property int themePadding: theme.themePadding
    property int themeRadius: theme.themeRadius
    property int themeSpacing: theme.themeSpacing

    property string sysFont:                themeFont ?? "Google Sans Flex"
    property int defaultSpacing:            themeSpacing ?? 8
    property int containerPadding:          themePadding ?? 16
    property int defaultRadius:             themeRadius ?? 8
}