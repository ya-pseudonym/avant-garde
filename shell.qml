import Quickshell
import QtQuick
import Quickshell.Io
import "widgets"
import "utils"
Scope {
	id: root
	Colors {
		id: colors
	}
	Config {
		id: config
	}
	IpcHandler {
		target: "config"

		function setRadius(radius: int): void {
			config.defaultRadius = radius
		}
		function setSpacing(spacing: int): void {
			config.defaultSpacing = spacing
		}
		function setPadding(padding: int): void {
			config.containerPadding = padding
		}
		function setFont(font: string): void {
			config.sysFont = font
		}

	}
	TopBar{
		id: topBar
	}
	Osd{}
	Dashboard{
		id: dash
	}
	IpcHandler {
		target: "dash"

		function setVisible(): void {
			dash.shouldShow = !dash.shouldShow
		}
	}
	Launcher {
		id: launcher
	}
	IpcHandler {
		target: "launcher"
		function setVisible(): void {
			launcher.shouldShow = !launcher.shouldShow
		}
	}
	}
