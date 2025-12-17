import sys
import duckdb
from pathlib import Path

if len(sys.argv) != 2:
    print("Usage: python scripts/run_sql.py path/to/file.sql")
    raise SystemExit(1)

sql_path = Path(sys.argv[1])
sql = sql_path.read_text()

con = duckdb.connect("online_retail.duckdb")
con.execute(sql)

print(f"Ran {sql_path}")
con.close()
