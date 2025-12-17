import duckdb
from pathlib import Path

con = duckdb.connect("online_retail.duckdb")

# ensure v_clean exists
con.execute(Path("sql/02_staging.sql").read_text())

metrics_sql = Path("sql/04_customer_metrics.sql").read_text()
df = con.execute(metrics_sql).df()

Path("outputs").mkdir(exist_ok=True)
out_path = Path("outputs/customer_metrics.csv")
df.to_csv(out_path, index=False)

print("Wrote", out_path)
print(df)

con.close()
