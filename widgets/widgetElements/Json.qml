import Quickshell
import Quickshell.Io
import QtQml

QtObject {
    function load(path) {
        try {
            const text = File.read(path);
            return JSON.parse(text);
        } catch (e) {
            console.error("Failed to load json: "path, e)
            return null
        }
    }
}