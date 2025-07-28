-- Geração por município entre 2016 e 2024
SELECT DISTINCT
    municipio,
    REPLACE(REPLACE(REPLACE(PRINTF("%,.2f", SUM(quantidade_gerada)), ',', 'X'), '.', ','), 'X', '.') AS quantidade_gerada
FROM pgrb_ibama
GROUP BY  municipio
