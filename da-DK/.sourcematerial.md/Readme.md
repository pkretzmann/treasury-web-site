# Kildemateriale til HTML

Denne mappe indeholder **kildematerialet** til dokumentationen i **dette sprog** — altså de rå
noter, brugervejledninger, PDF'er, tekstfiler og skærmbilleder, som de færdige HTML-sider
bygges ud fra. Hver sprogmappe (`da-DK/`, `en-US/`, …) har sin egen `.sourcematerial.md/`.

## Hvad bruges materialet til?

Indholdet her er **input** til `/html-guide`-kommandoen. Når kommandoen køres på et
emne, læser den kildematerialet i den relevante undermappe og danner en poleret,
selvstændig HTML-side ud fra det. De genererede HTML-sider lægges i **samme sprogmappe**
(og indgår i sprogets dokumentationsportal `index.html`).

```
<sprog>/.sourcematerial.md/<emne>/   →   /html-guide   →   <sprog>/<emne>/<side>.html
   (kildemateriale)                                          (færdig HTML-side)
```

Stylingen kommer fra projektets `.website/styles.css` (med fald-tilbage til den delte
`styles-default.css`), og den interaktive adfærd (indholdsfortegnelse, søgning,
kopiér-knapper, læse-fremgangslinje osv.) fra `script.js` i claude4bc-submodulet —
`/html-guide` inliner dem i hver side. Selve kildematerialet skal derfor **kun**
indeholde indhold — ikke styling.

## Organisering

Opret en undermappe pr. emne, fx:

| Mappe | Emne |
|-------|------|
| `<emne-1>/` | (kort beskrivelse) |
| `<emne-2>/` | (kort beskrivelse) |

Hver emnemappe kan indeholde flere filtyper:

- **`.md`** — den primære kilde (skrevne noter / brugervejledning i markdown)
- **`.pdf` / `.txt`** — originale vejledninger eller eksporter til reference
- **`.png`** — skærmbilleder af opsætning og felter

## Sådan tilføjer eller opdaterer du en side

1. Læg eller opdater kildematerialet i den relevante undermappe her.
2. Kør `/html-guide` på emnet for at danne (eller gendanne) HTML-siden, og læg den i
   den relevante undermappe under **samme** sprogmappe.
3. Kør `/update-website` for at opdatere portalens menu (se `.website/README.md`).
