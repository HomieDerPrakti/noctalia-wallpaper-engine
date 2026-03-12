import QtQuick
import QtQuick.Layouts
import qs.Widgets 1.0
import qs.Services.Noctalia 1.0

NButton {
    id: root
    
    // This makes the button trigger the panel we define below
    onClicked: {
        Noctalia.ipc.call("widget", "toggle", "wallpaper-engine-panel")
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: Style.marginS

        NIcon {
            name: "image-multiple-outline"
            size: Style.fontSizeM
        }

        NText {
            text: "Wallpapers"
            font.pointSize: Style.getBarFontSizeForScreen(screen?.name ?? "")
        }
    }
}