 SELECT 
    CASE 
        WHEN PH / 100 < 5.5 THEN '1. Muito Ácido (< 5.5)'
        WHEN PH / 100 BETWEEN 5.5 AND 6.5 THEN '2. Ácido (5.5-6.5)'
        WHEN PH / 100 BETWEEN 6.5 AND 7.5 THEN '3. Neutro/Ideal (6.5-7.5)'
        WHEN PH / 100 BETWEEN 7.5 AND 8.5 THEN '4. Alcalino (7.5-8.5)'
        ELSE '5. Muito Alcalino (> 8.5)'
    END AS classificacao_ph,
    COUNT(*) AS quantidade_leituras,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentual,
    ROUND(AVG(PH / 100), 2) AS ph_medio,
    ROUND(MIN(PH / 100), 2) AS ph_minimo,
    ROUND(MAX(PH / 100), 2) AS ph_maximo
FROM DADOS_SENSORES
GROUP BY 
    CASE 
        WHEN PH / 100 < 5.5 THEN '1. Muito Ácido (< 5.5)'
        WHEN PH / 100 BETWEEN 5.5 AND 6.5 THEN '2. Ácido (5.5-6.5)'
        WHEN PH / 100 BETWEEN 6.5 AND 7.5 THEN '3. Neutro/Ideal (6.5-7.5)'
        WHEN PH / 100 BETWEEN 7.5 AND 8.5 THEN '4. Alcalino (7.5-8.5)'
        ELSE '5. Muito Alcalino (> 8.5)'
    END
ORDER BY classificacao_ph;