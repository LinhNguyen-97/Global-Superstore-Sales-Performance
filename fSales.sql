WITH
  Trans_Location AS(
  SELECT
    DISTINCT City,
    State,
    Country,
    Region,
    Market
  FROM
    global-superstore-475905.global_superstore_rawdata.Orders ),
  dLocation AS(
  SELECT
    ROW_NUMBER() OVER (ORDER BY City, State, Country, Region, Market ) AS LocationID,
    *
  FROM
    Trans_Location )
SELECT
  `Order ID`,
  `Order Date`,
  `Ship Date`,
  `Ship Mode`,
  `Customer ID`,
  LocationID,
  `Product ID`,
  Sales,
  Quantity,
  Discount,
  Profit,
  `Shipping Cost`,
  `Order Priority`,
  Returned,
  CONCAT(`Ship Mode`," - ",`Order Priority`) AS `ShipMode - Priority`
FROM
  global-superstore-475905.global_superstore_rawdata.Orders
LEFT JOIN
  global-superstore-475905.global_superstore_rawdata.Returns
USING
  (`Order ID`)
LEFT JOIN
  dLocation
ON
  Orders.City = dLocation.City
  AND Orders.State = dLocation.State
  AND Orders.Country = dLocation.Country
  AND Orders.Region = dLocation.Region
  AND Orders.Market = dLocation.Market
