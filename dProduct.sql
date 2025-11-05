WITH
  CATEGORY AS (
  SELECT
    ROW_NUMBER() OVER(ORDER BY `Sub-Category`) AS SubCategoryID,
    *
  FROM (
    SELECT
      DISTINCT `Category`,
      `Sub-Category`
    FROM
      global-superstore-475905.global_superstore_rawdata.Orders ) )
SELECT
  DISTINCT a.`Product ID`,
  a.`Product Name`,
  b.SubCategoryID
FROM
  global-superstore-475905.global_superstore_rawdata.Orders a
LEFT JOIN
  CATEGORY b
ON
  a.`Sub-Category` = b.`Sub-Category`
