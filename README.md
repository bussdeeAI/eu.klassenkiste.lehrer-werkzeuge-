# Klassenkiste Lehrer-Werkzeuge – Omarchy Plugin

> **Plugin-ID:** `eu.klassenkiste.lehrer-werkzeuge`

Omarchy-Bar-Widget, das die **12 kostenlosen Lehrer-Werkzeuge** von
[klassenkiste.eu](https://klassenkiste.eu/werkzeuge) direkt in die Omarchy-Leiste
(Quattro-Shell) bringt: ein Klick auf das 🎓-Widget öffnet ein Panel mit allen
Werkzeugen, die dann im Standard-Browser laufen – auf dem Beamer-Laptop genauso
wie am Arbeitsplatz.

> **Live testen & anpassen:** [klassenkiste-omarchy.space-z.ai](https://klassenkiste-omarchy.space-z.ai) –
> Demo des Widgets, Editor für eigene Werkzeug-Links (generiert fertiges QML) und alle Downloads.

## Enthaltene Werkzeuge

| Werkzeug | Pfad | Wofür |
| --- | --- | --- |
| 🚦 Lärmampel | `/laermampel` | Lautstärke sichtbar machen (grün/gelb/rot) |
| ✋ Gib mir 5 | `/gib-mir-5` | Ruhe-Signal mit 5 Regeln und Countdown |
| 🫧 Atem-Ball | `/atem-ball` | Ruhige Atemübung zum Runterkommen |
| 🎯 Wer ist dran? | `/wer-ist-dran` | Fair auslosen, optional ohne Wiederholung |
| 🎡 Glücksrad | `/gluecksrad` | Namen eintragen, drehen, auslosen |
| 🎲 Würfel | `/wuerfel` | 1–6 Würfel groß am Beamer |
| 👥 Gruppen-Einteiler | `/gruppen-einteiler` | Klasse fair aufteilen |
| 🪑 Sitzplan-Generator | `/sitzplan` | Tische anordnen, Namen verteilen, drucken |
| ⏱️ Unterrichts-Timer | `/timer` | Großer Countdown mit Signalton |
| 🎵 Stopp-Tanz | `/stopp-tanz` | Musik stoppen – alle frieren ein |
| 📝 Lückentext-Generator | `/lueckentext` | Arbeitsblatt mit Wortbank, druckbar |
| 🔗 QR-Code-Generator | `/qr-code` | Aus jedem Link ein QR-Code |

Zusätzlich öffnet eine dezente Zeile am Panel-Ende **klassenkiste.eu**. Im Panel
sind die Werkzeuge nach **Unterricht**, **Ruhe & Rituale** und **Organisation**
gruppiert.

## Installation

Voraussetzung: [Omarchy](https://omarchy.org) (das Plugin nutzt die Quattro-Shell
von Omarchy 4 – `BarWidget`/`Panel` aus Quickshell).

### Variante A – per `omarchy` CLI (empfohlen)

```bash
omarchy plugin add https://github.com/bussdeeAI/eu.klassenkiste.lehrer-werkzeuge-.git --enable
```

Die CLI klont das Repo, prüft `manifest.json` und legt es unter
`~/.config/omarchy/plugins/eu.klassenkiste.lehrer-werkzeuge/` ab.
Danach erscheint das 🎓-Widget rechts in der Leiste (es zeigt nur das Icon und
hält die Leiste so schmal – der Name steht im Tooltip).

### Variante B – per Download (ZIP)

1. ZIP laden – entweder [direkt aus dem GitHub-Repo](https://github.com/bussdeeAI/eu.klassenkiste.lehrer-werkzeuge-/archive/refs/heads/main.zip)
   oder über die Plugin-Seite auf klassenkiste.eu (Button „PlugIn als ZIP laden“).
2. Entpacken und Ordner an die richtige Stelle verschieben:

```bash
unzip eu.klassenkiste.lehrer-werkzeuge--main.zip
mv eu.klassenkiste.lehrer-werkzeuge--main \
  ~/.config/omarchy/plugins/eu.klassenkiste.lehrer-werkzeuge

omarchy plugin validate ~/.config/omarchy/plugins/eu.klassenkiste.lehrer-werkzeuge
omarchy plugin enable eu.klassenkiste.lehrer-werkzeuge
```

> **Hinweis:** Beim Entpacken aus GitHub heißt der Ordner
> `eu.klassenkiste.lehrer-werkzeuge--main` (mit `-main`-Suffix) – nach dem
> Verschieben trägt er den korrekten Plugin-ID-Namen.

### Variante C – manuell per git

```bash
git clone https://github.com/bussdeeAI/eu.klassenkiste.lehrer-werkzeuge-.git \
  ~/.config/omarchy/plugins/eu.klassenkiste.lehrer-werkzeuge

omarchy plugin validate ~/.config/omarchy/plugins/eu.klassenkiste.lehrer-werkzeuge
omarchy plugin enable eu.klassenkiste.lehrer-werkzeuge
```

## Entfernen

```bash
omarchy plugin remove eu.klassenkiste.lehrer-werkzeuge
```

oder über das Menü: **Setup → Plugins → Remove**.
Das Deaktivieren ohne Löschen: `omarchy plugin disable eu.klassenkiste.lehrer-werkzeuge`.

## Nutzung

- Das Widget zeigt **nur das 🎓-Icon** – schmal in der Leiste; Name und Hinweise
  stehen im Tooltip.
- **Klick** auf das 🎓-Widget in der Leiste → Panel öffnet sich.
- **Rechtsklick** auf das 🎓-Widget → öffnet klassenkiste.eu direkt.
- **Werkzeug antippen** → öffnet im Standard-Browser (z. B. `firefox https://klassenkiste.eu/timer`).
- **Esc** oder Klick außerhalb → Panel schließen.
- **Tab** im Panel → zur nächsten Leisten-Panel wechseln (Standard-Verhalten).

## Dateien

```
eu.klassenkiste.lehrer-werkzeuge/
├── manifest.json   # Plugin-Manifest (schemaVersion 1, Kind: bar-widget)
├── BarWidget.qml   # Eintrag in der Omarchy-Leiste
├── Panel.qml       # Panel mit den 12 Werkzeugen + dezentem Klassenkiste-Link
├── README.md       # Diese Datei
├── CHANGELOG.md    # Versionshistorie
├── LICENSE         # MIT
└── preview.png     # Vorschau für den Plugin-Marketplace
```

## Profi-Tipps

```bash
# Manifest validieren (nach eigenen Anpassungen sinnvoll):
omarchy plugin validate ~/.config/omarchy/plugins/eu.klassenkiste.lehrer-werkzeuge

# Installierte Plugins mit Status prüfen:
omarchy plugin list --json

# Widget in einen anderen Leisten-Bereich legen:
#   In manifest.json unter "barWidget" "defaultSection" auf "left" oder "center" setzen.
```

QML-Anpassungen (z. B. eigene Links in `Panel.qml`) übernimmt die Shell im
Regelbetrieb automatisch – sonst einmal `omarchy plugin disable` + `enable`,
bzw. neu einloggen.

## Externe Abhängigkeiten

- **Omarchy** mit Quattro-Shell (Quickshell) – stellt `BarWidget`, `Panel`,
  `KeyboardPanel`, `WidgetButton` und die `qs.Commons`/`qs.Ui`-Bibliotheken bereit.
- **Standard-Browser** – die Werkzeuge selbst laufen auf klassenkiste.eu im Browser;
  das Plugin überträgt keine Daten und startet keine Hintergrundprozesse.

## Datenschutz

Das Plugin führt **keine eigene Datenverarbeitung** durch: Es zeigt eine Liste
verlinkter Werkzeuge und öffnet URLs im Browser. Kein Tracking, keine
Telemetrie, keine Zugriffsrechte auf Dateien oder Geräte.

## Marketplace

Das Plugin ist für das offizielle Omarchy-Plugin-Verzeichnis vorbereitet
(Kategorie: *Productivity*, Tags: `education`, `launcher`, `bar`) und kann über
das [Submission-Formular](https://github.com/omacom/omarchy-plugin-marketplace)
eingereicht werden.

## Lizenz

MIT – siehe [LICENSE](LICENSE). Die Werkzeuge selbst gehören
[klassenkiste.eu](https://klassenkiste.eu) (© Sebastian Blunk, Lübeck).

## Versionshistorie

Siehe [CHANGELOG.md](CHANGELOG.md) – aktuell: **v1.0.1** (Marketplace-Release).
