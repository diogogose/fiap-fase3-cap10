SELECT 
    BOMBA_LIGADA,
    COUNT(*) AS total_eventos,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentual,
    ROUND(AVG(UMIDADE_SOLO / 100), 2) AS umidade_media,
    ROUND(AVG(TEMPERATURA / 100), 2) AS temperatura_media,
    ROUND(AVG(PH / 100), 2) AS ph_medio
FROM DADOS_SENSORES
GROUP BY BOMBA_LIGADA
ORDER BY BOMBA_LIGADA;
