import duckdb
from pathlib import Path

con = duckdb.connect("online_retail.duckdb")

# make sure view exists
con.execute(Path("sql/02_staging.sql").read_text())

cohorts_sql = Path("sql/03_cohorts.sql").read_text()
df = con.execute(cohorts_sql).df()

Path("outputs").mkdir(exist_ok=True)
out_path = Path("outputs/cohorts.csv")
df.to_csv(out_path, index=False)

print("Wrote", out_path)
print("Rows:", len(df), "Cols:", len(df.columns))
print(df.head(15))

con.close()
