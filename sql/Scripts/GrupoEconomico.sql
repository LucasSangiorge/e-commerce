-- Total do Grupo Econômico

SELECT
e.NAME as nome_empresa,

	ROUND(sum(CASE
		WHEN s.CODE LIKE '1.%'
        THEN CAST(s.VALUE AS DECIMAL(18,2))
        ELSE 0
	END),2) AS total_ativos,
        
	ROUND(SUM(CASE
		WHEN s.CODE NOT LIKE '1.%'
        THEN CAST(s.VALUE AS DECIMAL(18,2))
        ELSE 0
	END),2) AS total_passivos,
    
    ROUND(SUM(CAST(s.VALUE AS DECIMAL(18,2))), 2) AS check_integridade
    
 FROM source s
 JOIN empresa e  ON s.CODE_EMPRESA = e.CODE
 WHERE s.DATA >='2023-01-01'
 AND   s.DATA <'2023-02-01'
GROUP BY E.NAME
ORDER BY E.NAME;
 

 