import pandas as pd

xlsx_path = "data/raw/online_retail.xlsx"
out_path = "data/processed/online_retail.csv"

df = pd.read_excel(xlsx_path)
df.to_csv(out_path, index=False)

print("Wrote:", out_path)
print("Shape:", df.shape)
print("Columns:", list(df.columns))
