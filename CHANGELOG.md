# Changelog – Klassenkiste Lehrer-Werkzeuge (Omarchy-PlugIn)

Alle nennenswerten Änderungen dieses PlugIns werden hier dokumentiert.
Format orientiert an [Keep a Changelog](https://keepachangelog.com/de/1.1.0/), Versionierung nach [SemVer](https://semver.org/lang/de/).

## [1.0.1] – Marketplace-Release

### Geändert
- Panel: Die 12 Werkzeuge sind jetzt in drei Gruppen sortiert – **Unterricht**,
  **Ruhe & Rituale** und **Organisation** (passend zur Website) – so findet man
  das gesuchte Werkzeug noch schneller.
- Footer: Der Spenden-Link ist aus dem Panel entfernt (Spenden weiterhin auf
  klassenkiste.eu möglich). **klassenkiste.eu** ist unten im Panel jetzt als
  dezente Ein-Zeilen-Verlinkung verlinkt – platzsparend, ohne große Karte.
- Panel-Kopf zeigt zusätzlich die PlugIn-Version an.
- Leisten-Widget: kompakt – zeigt nur noch das 🎓-**Icon** ohne Text-Label, die
  Leiste bleibt schmal (Name und Hinweise stehen im Tooltip). **Rechtsklick** auf
  das Widget öffnet klassenkiste.eu direkt im Browser (Linksklick wie bisher das
  Panel).

### Hinzugefügt
- `preview.png` im Repo-Stamm für die Vorschau im Omarchy-Plugin-Marketplace.

### Datenschutz (unverändert)
- Kein Tracking, keine Telemetrie, keine Hintergrundprozesse – das PlugIn öffnet
  ausschließlich URLs im Standard-Browser.

## [1.0.0] – Initial Release

### Hinzugefügt
- Bar-Widget „🎓 Werkzeuge" für die Omarchy-Leiste (Quattro-Shell, Omarchy 4)
- Panel mit allen 12 kostenlosen Lehrer-Werkzeugen von klassenkiste.eu als Deep-Links:
  Lärmampel, Gib mir 5, Atem-Ball, Wer ist dran?, Glücksrad, Würfel,
  Gruppen-Einteiler, Sitzplan-Generator, Unterrichts-Timer, Stopp-Tanz,
  Lückentext-Generator, QR-Code-Generator
- Footer-Einträge im Panel: „klassenkiste.eu öffnen" und Spenden-Link (paypal.me/bussdee)
- `manifest.json` nach der offiziellen Plugin-Spec (schemaVersion 1, Kind: bar-widget)
- README mit Installation, Entfernung, Anpassung und Marketplace-Hinweisen

### Datenschutz
- Kein Tracking, keine Telemetrie, keine Hintergrundprozesse – das PlugIn öffnet ausschließlich URLs im Standard-Browser.
