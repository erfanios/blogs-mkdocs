# Einige Notizen


## irreduzibel
Ist eine verallgemeinerung der Primzal.
Eine Polynom ist irreduzibel, wenn man es nicht als Produkt von zwei Polynomen kleineren Grades schreiben kann.


Wichtig: Irreduzibilität hängt immer vom gewählten Grundkörper $K$ ab!Das Polynom $X^2 + 1$ ist über $\mathbb{R}$ irreduzibel, aber über den komplexen Zahlen $\mathbb{C}$ reduzibel, da $X^2 + 1 = (X - i)(X + i)$.

- Reduzibel über $\mathbb{R}$:
    $X^2 - 4 = (X - 2)(X + 2)$(Lässt sich weiter zerlegen).
- Irreduzibel über $\mathbb{R}$:
    $X^2 + 1$(Lässt sich über den reellen Zahlen nicht in reelle Linearfaktoren zerlegen, hat keine reellen Nullstellen).

**Sonderfall bei kleinen Gradzahlen (Grad 2 und 3)**

Ein Polynom vom Grad 2 oder 3 ist über einem Körper $K$ genau dann irreduzibel, wenn es keine Nullstelle in $K$ besitzt. (Bei Grad $\ge 4$ gilt das nicht mehr zwingend, da sich z. B. $X^4 + 2X^2 + 1 = (X^2+1)^2$ ohne Nullstellen zerlegen lässt).

**Wie tested man es in diesem Fall:** Angenomen wir befinden uns in dem Fall $\mathbb{F}_2$ wo nur zwei elemente {1, 0} in dem Körper existieren. Um zu gucken das die funktion keine Nullstellen im Körper hat kann man alle werte {1, 0} einsetzen und überprüfen, ob 0 rauskommt, wenn nicht dann ist die Funktion-polynom irreduzibel.

---