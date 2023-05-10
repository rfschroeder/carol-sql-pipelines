CREATE TEMP FUNCTION CAPITALIZE(str STRING) AS (( 
  SELECT 
    IF(str = '', '',
      STRING_AGG(
        CONCAT(
          UPPER(SUBSTR(single_words,1,1)), 
          LOWER(SUBSTR(single_words,2))
        ), 
        '' ORDER BY position
      )
    )
  FROM UNNEST(REGEXP_EXTRACT_ALL(str, r' +|-+|.[^ -]*')) AS single_words
  WITH OFFSET AS position
));

SELECT
    CAPITALIZE(stg.name) AS mdmname,
    CONCAT("qarenan-", stg.name) AS mdmdescription,
    stg.price as mdmunitvalue,
    CASE
        WHEN stg.price > 1000 THEN true
        ELSE false
    END AS ispromotional
    --metadata{custom,product}--
FROM
    stg_custom_product AS stg
       
