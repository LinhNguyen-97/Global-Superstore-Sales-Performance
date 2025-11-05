SELECT
  ROW_NUMBER() OVER (ORDER BY City, State, Country, Region, Market, Region_use ) AS LocationID,
  *
FROM (
  SELECT
    DISTINCT City,
    State,
    Country,
    Region,
    Market,
    CASE
      WHEN State IN ("Alberta", "Manitoba", "Saskatchewan", "British Columbia") AND Region = "Canada" THEN "Western Canada"
      WHEN Region = "Canada" THEN "Eastern Canada"
      ELSE Region
  END
    AS Region_use
  FROM
    global-superstore-475905.global_superstore_rawdata.Orders )
