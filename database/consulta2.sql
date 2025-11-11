SELECT 
    CASE 
        WHEN TEMPERATURA / 100 < 15 THEN '1. Frio (< 15°C)'
        WHEN TEMPERATURA / 100 BETWEEN 15 AND 18 THEN '2. Fresco (15-18°C)'
        WHEN TEMPERATURA / 100 BETWEEN 18 AND 22 THEN '3. Ideal (18-22°C)'
        WHEN TEMPERATURA / 100 BETWEEN 22 AND 25 THEN '4. Quente (22-25°C)'
        ELSE '5. Muito Quente (> 25°C)'
    END AS faixa_temperatura,
    COUNT(*) AS quantidade_leituras,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentual,
    ROUND(AVG(UMIDADE_SOLO / 100), 2) AS umidade_media_associada
FROM DADOS_SENSORES
GROUP BY 
    CASE 
        WHEN TEMPERATURA / 100 < 15 THEN '1. Frio (< 15°C)'
        WHEN TEMPERATURA / 100 BETWEEN 15 AND 18 THEN '2. Fresco (15-18°C)'
        WHEN TEMPERATURA / 100 BETWEEN 18 AND 22 THEN '3. Ideal (18-22°C)'
        WHEN TEMPERATURA / 100 BETWEEN 22 AND 25 THEN '4. Quente (22-25°C)'
        ELSE '5. Muito Quente (> 25°C)'
    END
ORDER BY faixa_temperatura;
