SELECT
    stg.name AS mdmname,
    CONCAT("qarenan-", stg.name) AS mdmdescription,
    stg.price as mdmunitvalue,
    CASE
        WHEN stg.price > 1000 THEN true
        ELSE false
    END AS ispromotional
    --metadata{nlp,product}--
FROM
    stg_custom_product AS stg
       
