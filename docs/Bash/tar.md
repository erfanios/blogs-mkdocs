# Tar-Komprimierung & Entpacken

Eine Übersicht der verschiedenen Komprimierungs-Methoden mit `tar`, sortiert von der Standard-Komprimierung bis zur maximalen Dateigrößen-Reduzierung.

## 1. Übersicht der Algorithmen

| Methode | `tar`-Option | Dateiendung | Komprimierung | Geschwindigkeit |
| :--- | :--- | :--- | :--- | :--- |
| **gzip** | `-z` | `.tar.gz` | Standard | Sehr schnell |
| **bzip2** | `-j` | `.tar.bz2` | Gut | Langsam |
| **zstd** | `--zstd` | `.tar.zst` | Sehr gut | Extrem schnell |
| **xz** | `-J` | `.tar.xz` | **Maximal** | Eher langsam |

---

## 2. Archive erstellen (Komprimieren)

!!! tip "Hinweis zur Reihenfolge"
    Das Flag `-f` erfordert immer direkt danach den Namen der Ziel-Archivdatei!

### XZ – Höchste Komprimierung (Kleinstmögliche Datei)
Ideal für Archive, bei denen die Dateigröße die wichtigste Rolle spielt (oft 10–30 % kleiner als `.tar.gz`).

```bash
# Standard XZ-Komprimierung
tar -cvJf archiv.tar.xz /pfad/zum/ordner/

# Maximale XZ-Komprimierung (Komprimierungsstufe 9)
XZ_OPT=-9 tar -cvJf archiv.tar.xz /pfad/zum/ordner/
```

### Zstandard (zstd) – Beste Performance & Hohe Komprimierung
Komprimiert fast so stark wie XZ, ist aber beim Entpacken und Nutzen mehrerer CPU-Kerne extrem schnell.

```bash
tar --zstd -cvf archiv.tar.zst /pfad/zum/ordner/
```

### Bzip2 – Klassische Alternative
Bietet eine bessere Komprimierung als gzip, ist aber langsamer.

```bash
tar -cvjf archiv.tar.bz2 /pfad/zum/ordner/
```

### Gzip – Standard & Kompatibilität
Der schnellste Standard-Klassiker für den alltäglichen Gebrauch.

```bash
tar -cvzf archiv.tar.gz /pfad/zum/ordner/
```

---

## 3. Archive entpacken (Dekomprimieren)

!!! tip "Automatisches Erkennen"
    Moderne `tar`-Versionen erkennen das Komprimierungsformat beim Entpacken meist automatisch über `-xvf`. Die expliziten Flags garantieren jedoch die korrekte Dekomprimierung.

### XZ (`.tar.xz`) entpacken
```bash
# In den aktuellen Ordner entpacken
tar -xvJf archiv.tar.xz

# In einen spezifischen Ordner entpacken
tar -xvJf archiv.tar.xz -C /ziel/pfad/
```

### Zstandard (`.tar.zst`) entpacken
```bash
# In den aktuellen Ordner entpacken
tar --zstd -xvf archiv.tar.zst

# In einen spezifischen Ordner entpacken
tar --zstd -xvf archiv.tar.zst -C /ziel/pfad/
```

### Bzip2 (`.tar.bz2`) entpacken
```bash
# In den aktuellen Ordner entpacken
tar -xvjf archiv.tar.bz2

# In einen spezifischen Ordner entpacken
tar -xvjf archiv.tar.bz2 -C /ziel/pfad/
```

### Gzip (`.tar.gz`) entpacken
```bash
# In den aktuellen Ordner entpacken
tar -xvzf archiv.tar.gz

# In einen spezifischen Ordner entpacken
tar -xvzf archiv.tar.gz -C /ziel/pfad/
```

---

## 4. Wichtigste Flags im Überblick

* `-c` (create): Erstellt ein neues Archiv.
* `-x` (extract): Entpackt ein bestehendes Archiv.
* `-v` (verbose): Zeigt den Fortschritt/die verarbeiteten Dateien im Terminal an.
* `-f` (file): Gibt den Dateinamen des Archivs an (MUSS am Ende der Optionen stehen).
* `-C` (directory): Zielverzeichnis für das Entpacken.
