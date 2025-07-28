# Conexão
import pandas as pd
import sqlite3

conn = sqlite3.connect('pgrb.db')

# Faz a leitura do arquivo disponível em: https://dadosabertos.ibama.gov.br/dados/RAPP/residuoSolidosGerador/relatorio.csv
pgrb = pd.read_csv("relatorio.csv",sep=";",low_memory=False)

# Adiciona os dados na tabela pgrb_ibama
pgrb.to_sql('pgrb_ibama', conn, if_exists='append', index=False)

# Encerra a conexão
conn.close()
