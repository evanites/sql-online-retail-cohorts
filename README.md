# SQL Online Retail Cohort Retention Demo

This repo is a small SQL portfolio project using the **UCI Online Retail** transactional dataset.
It loads the data into a local DuckDB database, builds a cleaned staging view, and produces:

- `outputs/cohorts.csv`: cohort retention counts by months since first purchase
- `outputs/customer_metrics.csv`: basic customer KPI summary (including repeat customer rate)

Dataset source: UCI Machine Learning Repository — Online Retail (2010–2011).  
https://archive.ics.uci.edu/dataset/352/online+retail

---

## Project Structure

- `data/raw/` (ignored by git): downloaded Excel file
- `data/processed/` (ignored by git): converted CSV
- `sql/`: SQL scripts (staging + cohorts + metrics)
- `scripts/`: Python scripts to run the pipeline
- `outputs/` (ignored by git): generated result CSVs

---

## How to Run (Mac / local)

From the repo root:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install duckdb pandas openpyxl
```

Put the downloaded dataset here:

data/raw/online_retail.xlsx

Convert Excel → CSV:

python scripts/convert_xlsx_to_csv.py


Load CSV into DuckDB:

python scripts/load_duckdb.py


Build staging view + export outputs:

python scripts/run_sql.py sql/02_staging.sql
python scripts/export_cohorts.py
python scripts/export_metrics.py

Outputs
outputs/cohorts.csv

Columns:

cohort_month: month of a customer’s first purchase

months_since_first: 0 = cohort month, 1 = next month, etc.

active_customers: distinct customers who purchased in that cohort/month offset

outputs/customer_metrics.csv

One-row KPI summary:

customers

avg_orders_per_customer

avg_total_revenue_per_customer

avg_order_value

repeat_customer_rate (share of customers with 2+ orders)

Notes / Assumptions

Rows with missing CustomerID are excluded from cohort analysis.

Revenue is computed as Quantity * UnitPrice and aggregated per invoice.


## 2) Save the file
Hit **⌘S**.

After that, go to GitHub Desktop and you should be ready to **commit + push**.

If you paste your current README contents, I can also tell you exactly where to fix the missing backticks, but the above replacement is the quickest.
::contentReference[oaicite:0]{index=0}
