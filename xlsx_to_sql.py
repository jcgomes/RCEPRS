# IMPORTAÇÃO DAS BASES DE DADOS DE PLANILHAS ELETRÔNICAS PARA BASE DE DADOS SQL

# Conexão com o SQLite
import pandas as pd
import sqlite3

conn = sqlite3.connect('base_de_dados.db')

# Base de dados de CNPJ de Santa Catarina da Receita Federal
cnpj = pd.read_excel('cnpj_sc.xlsx')
cnpj.to_sql('cnpj_sc', conn, if_exists='append', index=False)

# Sistema Nacional de Informações em Saneamento Básico (SINISA)
sinisa = pd.read_excel('SINISA.xlsx')
sinisa.to_sql('sinisa', conn, if_exists='append', index=False)

# Sistema Integrado de Gestão de Barragens de Mineração (SIGBM) da ANM
barragens = pd.read_excel('barragens.xlsx')
barragens.to_sql('mineracao_barragens', conn, if_exists='append', index=False)

# Sistema de Informações Geográficas da Mineração (SIGMINE) da ANM
sigmine = pd.read_excel('mineracao_sc.xlsx')
sigmine.to_sql('mineracao_sigmine', conn, if_exists='append', index=False)

# Declaração de Movimentação de Resíduos Sólidos Urbanos (DMRSU) do IMA
dmr1 = pd.read_excel('dmr 2019.xlsx')
dmr2 = pd.read_excel('dmr 2020.xlsx')
dmr3 = pd.read_excel('dmr 2021.xlsx')
dmr4 = pd.read_excel('dmr 2022.xlsx')
dmr5 = pd.read_excel('dmr 2023.xlsx')
dmr6 = pd.read_excel('dmr 2024.xlsx')

dmr1.to_sql('dmr', conn, if_exists='append', index=False)
dmr2.to_sql('dmr', conn, if_exists='append', index=False)
dmr3.to_sql('dmr', conn, if_exists='append', index=False)
dmr4.to_sql('dmr', conn, if_exists='append', index=False)
dmr5.to_sql('dmr', conn, if_exists='append', index=False)
dmr6.to_sql('dmr', conn, if_exists='append', index=False)

# Manifesto de Transporte de Resíduos (MTR) do IMA
mtr1 = pd.read_excel('MTR - 2019 - JANEIRO A JUNHO.xlsx')
mtr2 = pd.read_excel('MTR - 2019 - JULHO A DEZEMBRO.xlsx')
mtr3 = pd.read_excel('MTR - 2020 - JANEIRO A JUNHO.xlsx')
mtr4 = pd.read_excel('MTR - 2020 - JULHO A DEZEMBRO.xlsx')
mtr5 = pd.read_excel('MTR - 2021 - JANEIRO A JUNHO.xlsx')
mtr6 = pd.read_excel('MTR - 2021 - JULHO A DEZEMBRO.xlsx')
mtr7 = pd.read_excel('MTR - 2022 - JANEIRO A JUNHO.xlsx')
mtr8 = pd.read_excel('MTR - 2022 - JULHO A DEZEMBRO.xlsx')
mtr9 = pd.read_excel('MTR - 2023 - JANEIRO A JUNHO.xlsx')
mtr10 = pd.read_excel('MTR - 2023 - JULHO A DEZEMBRO.xlsx')
mtr11 = pd.read_excel('MTR - 2024 - JANEIRO A JUNHO.xlsx')
mtr12 = pd.read_excel('MTR - 2024 - JULHO A NOVEMBRO.xlsx')

mtr1.to_sql('mtr', conn, if_exists='append', index=False)
mtr2.to_sql('mtr', conn, if_exists='append', index=False)
mtr3.to_sql('mtr', conn, if_exists='append', index=False)
mtr4.to_sql('mtr', conn, if_exists='append', index=False)
mtr5.to_sql('mtr', conn, if_exists='append', index=False)
mtr6.to_sql('mtr', conn, if_exists='append', index=False)
mtr7.to_sql('mtr', conn, if_exists='append', index=False)
mtr8.to_sql('mtr', conn, if_exists='append', index=False)
mtr9.to_sql('mtr', conn, if_exists='append', index=False)
mtr10.to_sql('mtr', conn, if_exists='append', index=False)
mtr11.to_sql('mtr', conn, if_exists='append', index=False)
mtr12.to_sql('mtr', conn, if_exists='append', index=False)

conn.close()