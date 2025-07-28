DELETE FROM pgrb_ibama
WHERE uf <> 'SANTA CATARINA'
AND (
    ano_da_geracao < 2016
    OR ano_da_geracao > 2024
)
AND codigo_residuo NOT IN (
    '10101', '10102', '10304', '10305', '10306',
    '10307', '10308', '10309', '10399', '10407',
    '10408', '10409', '10410', '10412', '10413',
    '10499', '10504', '10505', '10506', '10507',
    '10508', '10599'
);
