import QtQuick
import qs.Widgets
import qs.Services.Noctalia
import qs.Widgets 1.0

Item {
    id: root
    implicitWidth: row.implicitWidth + Style.marginM * 2
    implicitHeight: Style.barHeight

    Row {
        id: row
        anchors.centerIn: parent
        spacing: Style.marginS

        Text {
            text: "Wallpaper Engine"
            color: Color.mOnSurface
            font.pointSize: Style.getBarFontSizeForScreen(screen?.name ?? "")
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            // This is where you trigger your selection menu
            Noctalia.ipc.call("widget", "toggle", "wallpaper-engine-panel")
        }
    }
}