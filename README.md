# Dokumentation

Brugervejledninger og tekniske noter, samlet i en lille portal med sidebjælke, søgning og et
indholdsvindue. Sitet er **flersproget**: roden indeholder kun en `index.html`, der sender
dig videre til dit sprog, og hvert sprog har sin egen portal i en undermappe:

```
.website/
├── index.html        ← sender videre til dit sprog (standard: da-DK)
├── da-DK/            ← dansk portal + sider
│   └── index.html
└── en-US/            ← engelsk portal + sider
    └── index.html
```

## Sådan åbner du dokumentationen

### Anbefalet: dobbeltklik `Start dokumentation.cmd`
Filen starter en lille lokal webserver og åbner portalen i din browser automatisk.
Du lander på rod-`index.html`, der straks sender dig videre til dit sprog. Luk det sorte
vindue igen for at stoppe serveren.

> **Hvorfor en server?** Hvis du bare dobbeltklikker en `index.html` (åbner som `file://`),
> kan **søgningen kun lede i sidernes titler**. Browsere blokerer nemlig af sikkerhedshensyn,
> at en `file://`-side henter indholdet af nabosider. Når dokumentationen i stedet serveres
> over `http://localhost`, kan portalen læse alle siders indhold og søge i **hele teksten**.

### Manuelt (hvis du hellere vil skrive kommandoen selv)
Åbn en terminal (PowerShell) i denne mappe og kør:

```powershell
py serve.py 8769
```

Virker `py` ikke, så prøv:

```powershell
python serve.py 8769
```

Åbn derefter **http://localhost:8769/** i din browser. Stop serveren igen med `Ctrl + C`
i terminalen.

> Mangler du Python? Hent det på <https://www.python.org/downloads/> og husk at sætte
> flueben i *"Add Python to PATH"* under installationen.

## Hosting på GitHub Pages
Lægges mappen på GitHub Pages (eller en anden http(s)-webserver), virker fuldtekst-søgningen
helt af sig selv — uden den lokale server. Det er den samme mekanik: indholdet ligger på
samme origin og kan derfor læses af portalen.

## Tilføj en ny side
1. Læg kildematerialet i dit sprogs mappe, `<sprog>/.sourcematerial.md/<emne>/`
   (fx `da-DK/.sourcematerial.md/<emne>/`), og kør `/html-guide` på det.
2. Læg den genererede HTML-fil i den relevante undermappe under **samme** sprogmappe
   (fx `da-DK/<emne>/`).
3. Kør `/update-website` — den scanner hver sprogmappe og opdaterer den pågældende portals
   menu automatisk (og holder rod-redirectens sprogliste opdateret).

Du behøver ikke redigere nogen `index.html` i hånden; `/update-website` bygger menuen ud fra
de filer der ligger i hver sprogmappe.

## Tilføj et nyt sprog
1. Opret en ny sprogmappe, fx `.website/de-DE/`, med en `.sourcematerial.md/`-undermappe.
2. Læg sider i den som beskrevet ovenfor og kør `/update-website` — den danner sprogets portal
   og tilføjer sproget til rod-redirecten.
