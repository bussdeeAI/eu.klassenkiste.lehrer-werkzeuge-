import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

// Panel des Klassenkiste-Plugins: listet die 12 kostenlosen Lehrer-Werkzeuge
// von klassenkiste.eu und öffnet sie im Standard-Browser.
// Ganz unten: Link zur Klassenkiste und der Spenden-Button (PayPal).

Panel {
    id: root

    moduleName: "eu.klassenkiste.lehrer-werkzeuge"
    manageIpc: false

    property var anchorItem: null
    property var hostWidget: null

    readonly property string baseUrl: "https://klassenkiste.eu"
    readonly property string donateUrl: "https://paypal.me/bussdee"

    // Die 12 kostenlosen Werkzeuge von https://klassenkiste.eu/werkzeuge
    readonly property var tools: [
        {
            icon: "🚦",
            name: "Lärmampel",
            path: "/laermampel",
            hint: "Lautstärke sichtbar machen: grün, gelb, rot"
        },
        {
            icon: "✋",
            name: "Gib mir 5",
            path: "/gib-mir-5",
            hint: "Ruhe-Signal mit fünf Regeln und Countdown"
        },
        {
            icon: "🫧",
            name: "Atem-Ball",
            path: "/atem-ball",
            hint: "Ruhige Atemübung zum Runterkommen"
        },
        {
            icon: "🎯",
            name: "Wer ist dran?",
            path: "/wer-ist-dran",
            hint: "Fair auslosen – optional ohne Wiederholung"
        },
        {
            icon: "🎡",
            name: "Glücksrad",
            path: "/gluecksrad",
            hint: "Namen eintragen, drehen, fair auslosen"
        },
        {
            icon: "🎲",
            name: "Würfel",
            path: "/wuerfel",
            hint: "Ein bis sechs Würfel, groß am Beamer"
        },
        {
            icon: "👥",
            name: "Gruppen-Einteiler",
            path: "/gruppen-einteiler",
            hint: "Klasse fair aufteilen, druckbare Liste"
        },
        {
            icon: "🪑",
            name: "Sitzplan-Generator",
            path: "/sitzplan",
            hint: "Tische anordnen, Namen verteilen, drucken"
        },
        {
            icon: "⏱️",
            name: "Unterrichts-Timer",
            path: "/timer",
            hint: "Großer Countdown mit Signalton am Ende"
        },
        {
            icon: "🎵",
            name: "Stopp-Tanz",
            path: "/stopp-tanz",
            hint: "Musik stoppen – alle frieren ein"
        },
        {
            icon: "📝",
            name: "Lückentext-Generator",
            path: "/lueckentext",
            hint: "Arbeitsblatt mit Wortbank in Minuten"
        },
        {
            icon: "🔗",
            name: "QR-Code-Generator",
            path: "/qr-code",
            hint: "Aus jedem Link ein QR-Code"
        }
    ]

    function open() {
        root.controller.show()
    }

    function close() {
        root.controller.hide()
    }

    function switchPanel(direction) {
        if (root.bar && typeof root.bar.switchPanelFrom === "function")
            return root.bar.switchPanelFrom(root.hostWidget || root, direction)

        return false
    }

    function openUrl(url) {
        Qt.openUrlExternally(url)
        root.close()
    }

    function openTool(path) {
        root.openUrl(root.baseUrl + path)
    }

    KeyboardPanel {
        id: panel

        anchorItem: root.anchorItem
        owner: root.hostWidget || root
        bar: root.bar
        open: root.opened
        focusTarget: keyCatcher
        contentWidth: panel.fittedContentWidth(Style.space(300))
        contentHeight: panel.fittedContentHeight(content.implicitHeight)

        PanelKeyCatcher {
            id: keyCatcher

            anchors.fill: parent
            onCloseRequested: root.close()
            onTabRequested: function(direction) {
                root.switchPanel(direction)
            }
        }

        Column {
            id: content

            width: parent.width
            spacing: Style.space(6)

            // ── Kopf ──────────────────────────────────────────────
            Item {
                width: parent.width
                height: headerCol.implicitHeight + Style.space(10)

                Column {
                    id: headerCol

                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: Style.space(4)
                    spacing: Style.space(2)

                    Text {
                        width: parent.width
                        text: "Klassenkiste · Lehrer-Werkzeuge"
                        color: root.barForeground
                        font.family: root.bar ? root.bar.fontFamily : Style.font.family
                        font.pixelSize: Style.font.subtitle
                        font.bold: true
                        elide: Text.ElideRight
                    }

                    Text {
                        width: parent.width
                        text: "12 kostenlose Tools – öffnen im Browser"
                        color: root.barForeground
                        opacity: 0.55
                        font.family: root.bar ? root.bar.fontFamily : Style.font.family
                        font.pixelSize: Math.max(10, Math.round(Style.font.subtitle * 0.72))
                        elide: Text.ElideRight
                    }
                }
            }

            // ── Werkzeug-Liste ────────────────────────────────────
            Repeater {
                model: root.tools

                delegate: Item {
                    required property var modelData
                    readonly property bool hovered: area.containsMouse

                    width: parent.width
                    height: rowCol.implicitHeight + Style.space(12)

                    Rectangle {
                        anchors.fill: parent
                        radius: Style.space(6)
                        color: root.barForeground
                        opacity: parent.hovered ? 0.12 : 0
                    }

                    Column {
                        id: rowCol

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: Style.space(6)
                        anchors.rightMargin: Style.space(6)
                        spacing: Style.space(1)

                        Text {
                            width: parent.width
                            text: modelData.icon + "  " + modelData.name
                            color: root.barForeground
                            font.family: root.bar ? root.bar.fontFamily : Style.font.family
                            font.pixelSize: Style.font.subtitle
                            font.bold: hovered ? true : false
                            elide: Text.ElideRight
                        }

                        Text {
                            width: parent.width
                            text: modelData.hint
                            color: root.barForeground
                            opacity: 0.55
                            font.family: root.bar ? root.bar.fontFamily : Style.font.family
                            font.pixelSize: Math.max(10, Math.round(Style.font.subtitle * 0.72))
                            elide: Text.ElideRight
                        }
                    }

                    MouseArea {
                        id: area

                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: root.openTool(modelData.path)
                    }
                }
            }

            // ── Trenner ───────────────────────────────────────────
            Rectangle {
                width: parent.width
                height: 1
                color: root.barForeground
                opacity: 0.15
            }

            // ── Klassenkiste ──────────────────────────────────────
            Item {
                width: parent.width
                height: footerText.implicitHeight + Style.space(12)

                Rectangle {
                    anchors.fill: parent
                    radius: Style.space(6)
                    color: root.barForeground
                    opacity: siteArea.containsMouse ? 0.12 : 0
                }

                Text {
                    id: footerText

                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: Style.space(6)
                    text: "📦  klassenkiste.eu öffnen"
                    color: root.barForeground
                    font.family: root.bar ? root.bar.fontFamily : Style.font.family
                    font.pixelSize: Style.font.subtitle
                    elide: Text.ElideRight
                }

                MouseArea {
                    id: siteArea

                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.openUrl(root.baseUrl)
                }
            }

            // ── Spenden ───────────────────────────────────────────
            Item {
                width: parent.width
                height: donateText.implicitHeight + Style.space(12)

                Rectangle {
                    anchors.fill: parent
                    radius: Style.space(6)
                    color: "#f0b429"
                    opacity: donateArea.containsMouse ? 0.9 : 0.25
                }

                Text {
                    id: donateText

                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: Style.space(6)
                    text: "💛  Spenden via PayPal – paypal.me/bussdee"
                    color: root.barForeground
                    font.family: root.bar ? root.bar.fontFamily : Style.font.family
                    font.pixelSize: Style.font.subtitle
                    font.bold: true
                    elide: Text.ElideRight
                }

                MouseArea {
                    id: donateArea

                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.openUrl(root.donateUrl)
                }
            }
        }
    }
}
