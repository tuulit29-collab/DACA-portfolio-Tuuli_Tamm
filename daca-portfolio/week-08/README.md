# Nädal 08

## Meeskonna teema
Python APIs - Meeskond ehitab modulaarse automatiseeritud pipeline'i, mis:
1. Pärib andmed UrbanStyle OÜ Supabase API-st
2. Töötleb andmed pandas pipeline'iga (puhastamine + transformeerimine)
3. Visualiseerib tulemused ja salvestab failidesse
4. Automatiseerib kogu protsessi üheks funktsiooniks koos ajastamisloogikaga
Väljund: Töötav end-to-end pipeline, kus 4 moodulit ühendatakse üheks süsteemiks.
Test: python pipeline.py peaks jooksma algusest lõpuni — andmete pärimisest kuni väljundfailideni.

## Minu roll
Roll C: Visualization + Saving (visualiseerimine ja salvestamine). Mu kood koondab müügiandmed nädalate kaupa, loob 2 Plotly diagrammi (nädala tulu + KPI kokkuvõte) ja salvestab kõik ajatempliga failidena output kausta — CSV ja HTML. Testisin eraldi näidisandmetega, ilma et peaks teiste rollide koodi ootama. Minu visualize_export.py kasutab Roll A fetch_sales() funktsiooni, mis omab automaatset CSV fallback'i — kui Supabase ei vasta, jätkub pipeline kohalike varuandmetega.

## AI kasutamine
Claude Ai abil selgus, et integratsioonil pipeline.py ootas minu failist funktsiooni, mis oli kogemata eemaldatud — sain ImportError. Leidsin täpse põhjuse, lisasin funktsiooni tagasi ja kontrollisin, et nii eraldi käivitamine kui ka pipeline'iga koostöö töötavad. Ühel tiimiliikmel oli kasutusel Chat GPT rakendus, mis aitas veelgi täpsemini vigu kontrollida, millest oli samuti meie tiimile kasu, kuna saime nii leida üles veel need vead, mida teistel kasutuse solnud AId ei leidnud.

