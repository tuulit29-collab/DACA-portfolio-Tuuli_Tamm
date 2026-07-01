#!/usr/bin/env bash
set -e
cd daca-portfolio

echo "Nädal 01..."
mkdir -p week-01/individual week-01/team
curl -sL -o week-01/individual/Nadal1_rollC.docx "https://github.com/user-attachments/files/29473622/Nadal1_rollC.docx"
curl -sL -o week-01/team/N1_Tiim_Toode.pdf "https://github.com/user-attachments/files/29473420/N1_Tiim_.Toode.pdf"

echo "Nädal 02..."
mkdir -p week-02/individual week-02/team
curl -sL -o week-02/individual/Nadal2_rollD.docx "https://github.com/user-attachments/files/29473658/Nadal2_roll.D.docx"
curl -sL -o week-02/team/N2_SQL_puhastamine_Tiim_Toode.pdf "https://github.com/user-attachments/files/29473667/N2_SQL_puhastamine_Tiim_Toode.pdf"

echo "Nädal 03..."
mkdir -p week-03/individual week-03/team
curl -sL -o week-03/individual/Nadal3_rollA.docx "https://github.com/user-attachments/files/29474339/Nadal3_rollA.docx"
curl -sL -o week-03/team/N3_SQL_JOINs_Tiim_Toode.pdf "https://github.com/user-attachments/files/29474343/N3_SQL.JOINs._Tiim_TOODE.pdf"

echo "Nädal 04..."
mkdir -p week-04/individual week-04/team
curl -sL -o week-04/individual/Nadal4_rollB.docx "https://github.com/user-attachments/files/29474357/Nadal4_rollB.docx"
curl -sL -o week-04/team/N4_SQL_agregatsioon_Tiim_Toode.pdf "https://github.com/user-attachments/files/29474352/N4_.SQL.agregatsioon_Tiim_Toode.pdf"

echo "Nädal 05..."
mkdir -p week-05/individual week-05/team
curl -sL -o week-05/individual/nadal5_rollD_investor_dashboard.png "https://github.com/user-attachments/assets/887a4b96-e370-4cf9-91b5-81dba90260f8"
curl -sL -o week-05/team/N5_grupitoo_visualiseerimise_disain_tiim_toode.pdf "https://github.com/user-attachments/files/29474381/N5_grupitoo_visualiseerimise.disain_tiim.toode.pdf"

echo "Nädal 06..."
mkdir -p week-06/individual week-06/team
curl -sL -o week-06/individual/nadal6_rollA_tallinn_dashboard.png "https://github.com/user-attachments/assets/43b89185-dd9d-48fd-a0a6-49ef13f83862"
curl -sL -o week-06/team/N6_Visualiseerimise_andmed_grupitoo_TIIM_TOODE.pdf "https://github.com/user-attachments/files/29474389/N6_Visualiseerimise.andmed_grupitoo_.TIIM_.TOODE.1.pdf"

echo "Nädal 07..."
mkdir -p week-07/individual week-07/team
curl -sL -o week-07/individual/Nadal7_rollB.ipynb "https://github.com/user-attachments/files/29474502/Nadal7_rollB_lisatuna_rollileA.ipynb"
curl -sL -o week-07/team/Nadal7_rfm_complete.ipynb "https://github.com/user-attachments/files/29507618/Nadal7_rfm_complete.ipynb.ipynb"

echo "Nädal 08..."
mkdir -p week-08/individual week-08/team
curl -sL -o week-08/individual/visualize_export.py "https://github.com/user-attachments/files/29474536/Nadal8_roll_visualize_export.py"
curl -sL -o week-08/team/data_fetcher.py "https://github.com/user-attachments/files/29508072/Nadal8_rollA_data_fetcher.py"
curl -sL -o week-08/team/transform.py "https://github.com/user-attachments/files/29508098/Nadal8_rollB_transform.py"
curl -sL -o week-08/team/pipeline.py "https://github.com/user-attachments/files/29508085/Nadal8_rollD_pipeline.py"
cp week-08/individual/visualize_export.py week-08/team/visualize_export.py

echo ""
echo "=== Kontroll: failide suurused (0 baiti = midagi läks valesti) ==="
find week-01 week-02 week-03 week-04 week-05 week-06 week-07 week-08 -type f -newer /tmp -ls 2>/dev/null || \
find week-01/individual week-01/team week-02/individual week-02/team week-03/individual week-03/team week-04/individual week-04/team week-05/individual week-05/team week-06/individual week-06/team week-07/individual week-07/team week-08/individual week-08/team -type f -exec ls -la {} \;

echo ""
echo "Kui kõik failid näevad välja korras (pole 0 baiti), jooksuta:"
echo "  git add ."
echo "  git commit -m \"Lisan nädal 1-8 individuaalsed ja meeskonna failid õigesse kaustastruktuuri\""
echo "  git push"