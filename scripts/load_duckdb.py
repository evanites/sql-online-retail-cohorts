import duckdb

db_path = "online_retail.duckdb"
csv_path = "data/processed/online_retail.csv"

con = duckdb.connect(db_path)

con.execute(f"""
CREATE OR REPLACE TABLE online_retail AS
SELECT * FROM read_csv_auto('{csv_path}');
""")

row_count = con.execute("SELECT COUNT(*) FROM online_retail;").fetchone()[0]
print("Loaded rows:", row_count)

# quick peek
print("Sample rows:")
print(con.execute("SELECT * FROM online_retail LIMIT 5;").fetchdf())

con.close()
