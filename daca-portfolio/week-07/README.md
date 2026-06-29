# Nädal 07

## Meeskonna teema
Mida meie tiim Toode sel nädalal tegi / millise teema/probleemiga tegeles.

## Minu roll
Mida ma täpsemalt sel nädalal tegin, milline oli minu vastutus/ülesanne.

## AI osa minu töös
Kuidas ja kus kasutasin AI-d (nt Copilot, ChatGPT, Claude) oma töö käigus - mille jaoks, kuidas aitas.

## Failid ja pildid
[Nädal7_GT_Toode_koondfail.ipynb](https://github.com/user-attachments/files/29474431/Nadal7_GT_Toode_koondfail.ipynb)[Nädal7_rollB(B_lisatud_Ale).ipynb](https://github.com/user-attachments/files/29474439/Nadal7_rollB.B_lisatud_Ale.ipynb)


{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "1249c9ac",
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "from supabase import create_client, Client\n",
    "SUPABASE_URL = \"https://tlmvpjdflogvzpwukmjw.supabase.co\"\n",
    "SUPABASE_KEY = \"sb_publishable_VbD_kBUCSfZ2zGlNbKQ7lQ_yyrJh1uM\"\n",
    "supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "7088130c",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Sales shape: (1000, 12)\n",
      "   id  sale_id        invoice_id            sale_date  customer_id  \\\n",
      "0   1        1  INV-202301-00001  2023-01-10T00:00:00       2588.0   \n",
      "1   2        2  INV-202301-00002  2023-01-16T00:00:00       4338.0   \n",
      "2   3        3  INV-202301-00003  2023-01-05T00:00:00       4673.0   \n",
      "3   4        4  INV-202301-00004  2023-01-02T00:00:00       4677.0   \n",
      "4   5        5  INV-202301-00005  2023-01-13T00:00:00       2390.0   \n",
      "\n",
      "   product_id  quantity  unit_price  total_price channel store_location  \\\n",
      "0        1274         2      234.79       469.58    pood        Tallinn   \n",
      "1        1207         2      241.13       482.26    pood          Pärnu   \n",
      "2        1264         1      258.46       221.19    pood          Pärnu   \n",
      "3        1341         3       45.21       135.63    pood          Tartu   \n",
      "4        1284         1       99.57        99.57    pood          Tartu   \n",
      "\n",
      "  payment_method  \n",
      "0          kaart  \n",
      "1      järelmaks  \n",
      "2      järelmaks  \n",
      "3       sularaha  \n",
      "4          kaart  \n",
      "Customers shape: (1000, 9)\n",
      "   customer_id first_name last_name email           phone     city  \\\n",
      "0         2637       Reet      Nurk   NaN  +372 5354 8280  Tallinn   \n",
      "1         2723       Reet    Kuusik   NaN  +372 5603 8700    Tartu   \n",
      "2         2784       Mart      Pihl   NaN  +372 5536 5657  Tallinn   \n",
      "3         3404       Maie    Tammik   NaN  +372 5291 9215  Tallinn   \n",
      "4         4278       Nele      Orav   NaN  +372 8700 9137  Tallinn   \n",
      "\n",
      "  registration_date loyalty_tier  birth_year  \n",
      "0        2022-12-09         gold        1976  \n",
      "1        2023-04-09          NaN        1998  \n",
      "2        2022-10-30         gold        1989  \n",
      "3        2020-03-26          NaN        2000  \n",
      "4        2024-05-10          NaN        1992  \n",
      "Liidatud shape: (1000, 20)\n",
      "\n",
      "Veergude tüübid:\n",
      "id                     int64\n",
      "sale_id                int64\n",
      "invoice_id               str\n",
      "sale_date                str\n",
      "customer_id          float64\n",
      "product_id             int64\n",
      "quantity               int64\n",
      "unit_price           float64\n",
      "total_price          float64\n",
      "channel                  str\n",
      "store_location           str\n",
      "payment_method           str\n",
      "first_name               str\n",
      "last_name                str\n",
      "email                    str\n",
      "phone                    str\n",
      "city                     str\n",
      "registration_date        str\n",
      "loyalty_tier             str\n",
      "birth_year           float64\n",
      "dtype: object\n",
      "\n",
      "Esimesed read:\n",
      "   id  sale_id        invoice_id            sale_date  customer_id  \\\n",
      "0   1        1  INV-202301-00001  2023-01-10T00:00:00       2588.0   \n",
      "1   2        2  INV-202301-00002  2023-01-16T00:00:00       4338.0   \n",
      "2   3        3  INV-202301-00003  2023-01-05T00:00:00       4673.0   \n",
      "3   4        4  INV-202301-00004  2023-01-02T00:00:00       4677.0   \n",
      "4   5        5  INV-202301-00005  2023-01-13T00:00:00       2390.0   \n",
      "\n",
      "   product_id  quantity  unit_price  total_price channel store_location  \\\n",
      "0        1274         2      234.79       469.58    pood        Tallinn   \n",
      "1        1207         2      241.13       482.26    pood          Pärnu   \n",
      "2        1264         1      258.46       221.19    pood          Pärnu   \n",
      "3        1341         3       45.21       135.63    pood          Tartu   \n",
      "4        1284         1       99.57        99.57    pood          Tartu   \n",
      "\n",
      "  payment_method first_name last_name                email           phone  \\\n",
      "0          kaart      Hille      Paju                  NaN  +372 5429 0294   \n",
      "1      järelmaks        NaN       NaN                  NaN             NaN   \n",
      "2      järelmaks        NaN       NaN                  NaN             NaN   \n",
      "3       sularaha        NaN       NaN                  NaN             NaN   \n",
      "4          kaart      Triin      Lill  triin.lill@telia.ee  +372 5378 0596   \n",
      "\n",
      "      city registration_date loyalty_tier  birth_year  \n",
      "0  Tallinn        2022-07-28       bronze      1997.0  \n",
      "1      NaN               NaN          NaN         NaN  \n",
      "2      NaN               NaN          NaN         NaN  \n",
      "3      NaN               NaN          NaN         NaN  \n",
      "4    Tartu        2021-04-09          NaN      1996.0  \n",
      "  customer_id: OK\n",
      "  sale_date: OK\n",
      "  total_price: OK\n",
      "  email: OK\n"
     ]
    }
   ],
   "source": [
    "# Sales tabeli laadimine\n",
    "response = supabase.table(\"sales\").select(\"*\").execute()\n",
    "df_sales = pd.DataFrame(response.data)\n",
    "#kontroll\n",
    "print(\"Sales shape:\", df_sales.shape)\n",
    "print(df_sales.head())\n",
    "# Customers tabeli laadimine\n",
    "response = supabase.table(\"customers\").select(\"*\").execute()\n",
    "df_customers = pd.DataFrame(response.data)\n",
    "#kontrolli\n",
    "print(\"Customers shape:\", df_customers.shape)\n",
    "print(df_customers.head())\n",
    "#tabelite liitmine\n",
    "df = pd.merge(df_sales, df_customers, on='customer_id', how='left')\n",
    "print(\"Liidatud shape:\", df.shape)\n",
    "print(\"\\nVeergude tüübid:\")\n",
    "print(df.dtypes)\n",
    "print(\"\\nEsimesed read:\")\n",
    "print(df.head())\n",
    "# Kontrolli vajalike veergude olemasolu:\n",
    "required_cols = ['customer_id', 'sale_date', 'total_price', 'email']\n",
    "for col in required_cols:    \n",
    "    status = \"OK\" if col in df.columns else \"PUUDUB\"\n",
    "    print(f\"  {col}: {status}\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "e7c7a548",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Esialgne shape: (1000, 20)\n",
      "\n",
      "Duplikaadid: 0\n",
      "Pärast duplikaatide eemaldamist: (1000, 20)\n",
      "\n",
      "NULL-id:\n",
      " id                     0\n",
      "sale_id                0\n",
      "invoice_id             0\n",
      "sale_date              0\n",
      "customer_id           77\n",
      "product_id             0\n",
      "quantity               0\n",
      "unit_price             0\n",
      "total_price            0\n",
      "channel                0\n",
      "store_location       312\n",
      "payment_method         0\n",
      "first_name           725\n",
      "last_name            725\n",
      "email                752\n",
      "phone                725\n",
      "city                 725\n",
      "registration_date    725\n",
      "loyalty_tier         833\n",
      "birth_year           725\n",
      "dtype: int64\n",
      "Pärast NULL eemaldamist: (923, 20)\n",
      "\n",
      "sale_date tüüp: datetime64[us]\n",
      "\n",
      "Negatiivsed total_price väärtused: 16\n",
      "\n",
      "--- PUHASTUSRAPORT ---\n",
      "Lõplik shape: (907, 20)\n",
      "Unikaalseid kliente: 661\n",
      "Kuupäevavahemik: 2023-01-01 00:00:00 kuni 2026-03-17 00:00:00\n"
     ]
    }
   ],
   "source": [
    "# ROLL B: Andmete puhastamine\n",
    "\n",
    "# 1. Esialgne shape\n",
    "print(\"Esialgne shape:\", df.shape)\n",
    "\n",
    "# 2. Duplikaadid\n",
    "print(\"\\nDuplikaadid:\", df.duplicated().sum())\n",
    "df = df.drop_duplicates()\n",
    "print(\"Pärast duplikaatide eemaldamist:\", df.shape)\n",
    "\n",
    "# 3. NULL väärtused\n",
    "print(\"\\nNULL-id:\\n\", df.isnull().sum())\n",
    "df = df.dropna(subset=['customer_id', 'sale_date', 'total_price'])\n",
    "print(\"Pärast NULL eemaldamist:\", df.shape)\n",
    "\n",
    "# 4. Kuupäevade parsimine\n",
    "df['sale_date'] = pd.to_datetime(df['sale_date'])\n",
    "print(\"\\nsale_date tüüp:\", df['sale_date'].dtype)\n",
    "\n",
    "# 5. Outlier'id - negatiivsed hinnad\n",
    "print(\"\\nNegatiivsed total_price väärtused:\", (df['total_price'] <= 0).sum())\n",
    "df = df[df['total_price'] > 0]\n",
    "\n",
    "# 6. Puhastusraport\n",
    "print(\"\\n--- PUHASTUSRAPORT ---\")\n",
    "print(f\"Lõplik shape: {df.shape}\")\n",
    "print(f\"Unikaalseid kliente: {df['customer_id'].nunique()}\")\n",
    "print(f\"Kuupäevavahemik: {df['sale_date'].min()} kuni {df['sale_date'].max()}\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "f5706296",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "3.0.3\n"
     ]
    }
   ],
   "source": [
    "import pandas; print(pandas.__version__)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "0433397d",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Negatiivseid total_price väärtusi: 0\n",
      "Pärast outlier eemaldamist: (907, 20)\n"
     ]
    }
   ],
   "source": [
    "print(\"Negatiivseid total_price väärtusi:\", (df['total_price'] <= 0).sum())\n",
    "df = df[df['total_price'] > 0]\n",
    "print(\"Pärast outlier eemaldamist:\", df.shape)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "7e517d16",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "6.8.0\n"
     ]
    }
   ],
   "source": [
    "import plotly; print(plotly.__version__)\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "c39b4db8",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Requirement already satisfied: plotly in c:\\Users\\Tuuli\\AppData\\Local\\Programs\\Python\\Python314\\Lib\\site-packages (6.8.0)\n",
      "Requirement already satisfied: narwhals>=1.15.1 in c:\\Users\\Tuuli\\AppData\\Local\\Programs\\Python\\Python314\\Lib\\site-packages (from plotly) (2.22.1)\n",
      "Requirement already satisfied: packaging in c:\\Users\\Tuuli\\AppData\\Local\\Programs\\Python\\Python314\\Lib\\site-packages (from plotly) (26.2)\n",
      "Note: you may need to restart the kernel to use updated packages.\n"
     ]
    }
   ],
   "source": [
    "pip install plotly"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "15b59321",
   "metadata": {},
   "outputs": [],
   "source": [
    " pip install supabase python-dotenv pandas plotly\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2430d459",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.14.6"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
