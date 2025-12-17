CREATE OR REPLACE VIEW v_clean AS
SELECT
  CAST(InvoiceNo AS VARCHAR) AS invoice_no,
  CAST(StockCode AS VARCHAR) AS stock_code,
  CAST(Description AS VARCHAR) AS description,
  CAST(Quantity AS BIGINT) AS quantity,
  CAST(InvoiceDate AS TIMESTAMP) AS invoice_ts,
  CAST(UnitPrice AS DOUBLE) AS unit_price,
  CAST(CustomerID AS BIGINT) AS customer_id,
  CAST(Country AS VARCHAR) AS country
FROM online_retail
WHERE CustomerID IS NOT NULL
  AND Quantity IS NOT NULL
  AND UnitPrice IS NOT NULL;
