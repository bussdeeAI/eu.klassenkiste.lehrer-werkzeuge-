import QtQuick
import Quickshell
import qs.Ui

// Klassenkiste Lehrer-Werkzeuge – Bar-Widget für Omarchy (Quattro-Shell).
// Zeigt einen Eintrag in der Leiste und öffnet beim Klick das Werkzeug-Panel.
// Struktur folgt dem offiziellen Plugin-Beispiel (omarchy.clock).

BarWidget {
    id: root

    moduleName: "eu.klassenkiste.lehrer-werkzeuge"

    readonly property bool opened: panelLoader.item ? panelLoader.item.opened === true : false
    readonly property bool popoutSwitchClosing: panelLoader.item ? panelLoader.item.popoutSwitchClosing === true : false

    function open() {
        if (panelLoader.item) panelLoader.item.open()
    }

    function close() {
        if (panelLoader.item) panelLoader.item.close()
    }

    function toggle() {
        if (panelLoader.item) panelLoader.item.toggle()
    }

    function closeForPopoutSwitch() {
        if (panelLoader.item) panelLoader.item.closeForPopoutSwitch()
    }

    function injectPanel() {
        if (!panelLoader.item)
            return
        panelLoader.item.bar = root.bar
        panelLoader.item.anchorItem = button
        panelLoader.item.hostWidget = root
    }

    implicitWidth: button.implicitWidth
    implicitHeight: button.implicitHeight

    onBarChanged: injectPanel()

    Loader {
        id: panelLoader

        active: true
        source: Qt.resolvedUrl("Panel.qml")
        visible: false
        onLoaded: {
            root.injectPanel()
            Qt.callLater(root.injectPanel)
        }
    }

    WidgetButton {
        id: button

        anchors.fill: parent
        bar: root.bar
        text: "🎓"
        tooltipText: "Klassenkiste Lehrer-Werkzeuge · Links: Panel · Rechtsklick: klassenkiste.eu"
        onPressed: function(buttonCode) {
            if (buttonCode === Qt.LeftButton)
                root.toggle()
            else if (buttonCode === Qt.RightButton)
                Qt.openUrlExternally("https://klassenkiste.eu")
        }
    }
}
