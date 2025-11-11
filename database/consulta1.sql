SELECT 
    COUNT(*) AS total_leituras,
    MIN(DATA_HORA) AS primeira_leitura,
    MAX(DATA_HORA) AS ultima_leitura,
    ROUND(AVG(UMIDADE_SOLO / 100), 2) AS umidade_media,
    ROUND(MIN(UMIDADE_SOLO / 100), 2) AS umidade_minima,
    ROUND(MAX(UMIDADE_SOLO / 100), 2) AS umidade_maxima,
    ROUND(AVG(TEMPERATURA / 100), 2) AS temp_media,
    ROUND(MIN(TEMPERATURA / 100), 2) AS temp_minima,
    ROUND(MAX(TEMPERATURA / 100), 2) AS temp_maxima,
    ROUND(AVG(PH / 100), 2) AS ph_medio,
    ROUND(MIN(PH / 100), 2) AS ph_minimo,
    ROUND(MAX(PH / 100), 2) AS ph_maximo,
    ROUND(AVG(LEITURA_LDR), 2) AS luminosidade_media
FROM DADOS_SENSORES;