import streamlit as st
import pandas as pd
import sys
import os

# Import do projeto
sys.path.append(os.path.abspath("../python"))
from db_connection import get_connection

st.set_page_config(page_title="Dashboard E-commerce", layout="wide")
st.title("📊 Dashboard E-commerce")

conn = get_connection()

# ---- Carregar dados da Gold
df_faturamento = pd.read_sql(
    "SELECT * FROM vw_faturamento_mensal_gold",
    conn
)

df_ticket = pd.read_sql(
    "SELECT * FROM vw_ticket_medio_gold",
    conn
)

df_top_produtos = pd.read_sql(
    "SELECT * FROM vw_top_produtos_gold",
    conn
)

# ---- KPIs
col1, col2, col3 = st.columns(3)

col1.metric(
    "💰 Faturamento Total",
    f"R$ {df_ticket['faturamento_total'][0]:,.2f}"
)

col2.metric(
    "🧾 Total de Pedidos",
    int(df_ticket['total_pedidos'][0])
)

col3.metric(
    "🎯 Ticket Médio",
    f"R$ {df_ticket['ticket_medio'][0]:,.2f}"
)

st.divider()

# ---- Gráfico de faturamento
st.subheader("📈 Faturamento Mensal")
st.line_chart(
    df_faturamento.set_index("mes")["faturamento"]
)

# ---- Tabela Top Produtos
st.subheader("🏆 Top Produtos")
st.dataframe(df_top_produtos.head(10))