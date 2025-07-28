WITH codigos_referencia AS (
    SELECT "010101" AS codigo, "Resíduos da extração de minérios metálicos" AS tipo_residuo UNION ALL
    SELECT "010102", "Resíduos da extração de minérios não metálicos" UNION ALL
    SELECT "010304", "Rej. ger. de ácidos, result. da transformação de sulfuretos" UNION ALL
    SELECT "010305", "Outros rejeitados contendo substâncias perigosas" UNION ALL
    SELECT "010306", "Rejeitados não abrangidos em 01 03 04 e 01 03 05" UNION ALL
    SELECT "010307", "Outr. res. cont. subs. perigosas, result. da transf. fis. e quim. de min. metálicos" UNION ALL
    SELECT "010308", "Poeiras e pós não abrangidos em 01 03 07" UNION ALL
    SELECT "010309", "Lamas vermelhas da produção de alumina não abrangidas em 01 03 07" UNION ALL
    SELECT "010399", "Outros resíduos não anteriormente especificados" UNION ALL
    SELECT "010407", "Res. cont. subs. perig., result. da transf. fis. e quim. de min. não met." UNION ALL
    SELECT "010408", "Cascalhos e fragmentos de rocha não abrangidos em 01 04 07" UNION ALL
    SELECT "010409", "Areias e argilas" UNION ALL
    SELECT "010410", "Poeiras e pós não abrangidos em 01 04 07" UNION ALL
    SELECT "010412", "Rej. e outr. res., result. da lav. e limp. de min., não abr. em 01 04 07" UNION ALL
    SELECT "010413", "Resíduos do corte e serragem de pedra não abrangidos em 01 04 07" UNION ALL
    SELECT "010499", "Outros resíduos não anteriormente especificados" UNION ALL
    SELECT "010504", "Lodos e outros resíduos de perfuração contendo água doce" UNION ALL
    SELECT "010505", "Lodos e outros resíduos de perfuração contendo hidrocarbonetos" UNION ALL
    SELECT "010506", "Lodos e outros resíduos de perfuração contendo substâncias perigosas" UNION ALL
    SELECT "010507", "Lodos e outr. res. perf. cont. sais de bário não abr. em 01 05 05 e 01 05 06" UNION ALL
    SELECT "010508", "Lodos e outr. res. perf. cont. cloretos não abr. em 01 05 05 e 01 05 06" UNION ALL
    SELECT "010599", "Outros resíduos não anteriormente especificados"
)

SELECT
    r.codigo AS codigo_residuo,
    r.tipo_residuo,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2016 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2016,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2017 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2017,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2018 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2018,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2019 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2019,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2020 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2020,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2021 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2021,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2022 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2022,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2023 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2023,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CASE WHEN i.ano_da_geracao = 2024 THEN CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL) ELSE 0 END), 0)), ".", ",") AS quantidade_2024,
    REPLACE(PRINTF("%.2f", COALESCE(SUM(CAST(REPLACE(i.quantidade_gerada, ",", ".") AS REAL)), 0)), ".", ",") AS quantidade_total
FROM
    codigos_referencia r
LEFT JOIN
    pgrb_ibama i ON r.codigo = i.codigo_residuo
                AND i.ano_da_geracao BETWEEN 2016 AND 2024
                AND i.uf = "SANTA CATARINA"
                AND i.mesorregiao = "Norte Catarinense"
                AND i.codigo_residuo IN ('10101','10102','10304','10305','10306',
                      '10307','10308','10309','10399','10407',
                      '10408','10409','10410','10412','10413',
                      '10499','10504','10505','10506','10507',
                      '10508','10599')
GROUP BY
    r.codigo,
    r.tipo_residuo
ORDER BY
    r.codigo;
