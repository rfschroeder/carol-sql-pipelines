SELECT
    stg.name AS product_name,
    CONCAT("qarenan-", stg.name) AS product_description,
    stg.price as product_unit_value,
    CASE
        WHEN stg.price > 1000 THEN true
        ELSE false
    END AS product_is_promotional
FROM
    stg_product_product AS stg
       
