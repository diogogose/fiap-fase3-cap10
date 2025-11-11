SELECT 
    TRUNC(DATA_HORA) AS data,
    COUNT(*) AS leituras_dia,
    ROUND(AVG(UMIDADE_SOLO / 100), 2) AS umidade_media,
    ROUND(AVG(TEMPERATURA / 100), 2) AS temp_media,
    ROUND(AVG(PH / 100), 2) AS ph_medio,
    ROUND(AVG(LEITURA_LDR), 2) AS luminosidade_media,
    SUM(CASE WHEN BOMBA_LIGADA = 'true' THEN 1 ELSE 0 END) AS acionamentos_bomba
FROM DADOS_SENSORES
GROUP BY TRUNC(DATA_HORA)
ORDER BY data;