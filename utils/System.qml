pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property int mem
    property int cpu
    property int bat

    Process {
        id: memProc
        running: true
        command: ["sh", "-c", "free | grep Mem | awk '{print int($3/$2 * 100)}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.mem = parseInt(this.data);
            }
        }
    }
    Process {
        running: true
        id: batProc
        command: ["sh", "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.bat = parseInt(this.data);
                        }
                    }
            }
    Process {
        id: cpuProc
        running: true
        command: ["sh", "-c", "top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\\([0-9.]*\\)%* id.*/\\1/' | awk '{print 100 - $1}'"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.cpu = parseInt(this.data);
            }
        }
    }
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true;
            memProc.running = true;
            batProc.running = true;
        }
    }
}