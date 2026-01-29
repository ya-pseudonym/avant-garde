import Quickshell
import Quickshell.Io
import QtQuick
QtObject {
    id: themeManager

    property string themeDir: Qt.resolvedUrl("/home/pseudonym/.config/quickshell/themes")
    property var themes: []
    property var current: {}

    function scanThemes() {
        const files = File.list(themeDir);
        let list = []

        for (let f of files) {
            if (! f.endsWith(".json"))
                continue;
            const path = themeDir + f
            const data = Json.load(path)
            if (!data) continue

            list.push({
                name: f.replace(".json", ""),
                path: path,
                data: data
            })
        }
        themes = list
    }
    function apply(name) {
        const t = themes.find(x => x.name === name)
        if (!t) {
            console.warn("Theme not found: ", name);
            return
        }
        current = t.data
        console.log("Applied theme: ", name)
    }
    Component.onCompleted: scanThemes()
}