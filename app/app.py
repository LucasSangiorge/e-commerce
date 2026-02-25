# ========================
# CONFIG (SEMPRE PRIMEIRO)
# ========================
import streamlit as st
st.set_page_config(
    page_title="Dashboard E-commerce",
    layout="wide"
)

# ========================
# IMPORTS
# ========================
import pandas as pd
import mysql.connector

# ========================
# CONEXÃO
# ========================
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="901012",
    database="e_commerce"
)

# ========================
# QUERY GOLD (ou SILVER)
# ========================
query = """
SELECT
    p.data_pedido,
    pr.nome_produto,
    i.quantidade,
    i.preco_unitario,
    (i.quantidade * i.preco_unitario) AS valor_total
FROM pedidos_silver p
JOIN itens_pedido_silver i ON p.pedido_id = i.pedido_id
JOIN produtos_silver pr ON i.produto_id = pr.produto_id
"""

df = pd.read_sql(query, conn)

# ========================
# TRATAMENTO
# ========================
df["data_pedido"] = pd.to_datetime(df["data_pedido"])
df["ano"] = df["data_pedido"].dt.year
df["mes"] = df["data_pedido"].dt.month
df["nome_produto"] = df["nome_produto"].str.strip()

# ========================
# SIDEBAR - FILTROS
# ========================
st.sidebar.header("🎯 Filtros")

ano_sel = st.sidebar.selectbox(
    "Ano",
    sorted(df["ano"].unique())
)

mes_sel = st.sidebar.selectbox(
    "Mês",
    sorted(df[df["ano"] == ano_sel]["mes"].unique())
)

produto_sel = st.sidebar.multiselect(
    "Produto",
    df["nome_produto"].unique(),
    default=df["nome_produto"].unique()
)

# ========================
# APLICAR FILTROS
# ========================
df_filtrado = df[
    (df["ano"] == ano_sel) &
    (df["mes"] == mes_sel) &
    (df["nome_produto"].isin(produto_sel))
]

# ========================
# DASHBOARD
# ========================
st.title("📊 Dashboard de Vendas")

col1, col2, col3 = st.columns(3)

col1.metric(
    "💰 Faturamento",
    f"R$ {df_filtrado['valor_total'].sum():,.2f}"
)

col2.metric(
    "📦 Quantidade Vendida",
    int(df_filtrado["quantidade"].sum())
)

col3.metric(
    "🧾 Registros",
    df_filtrado.shape[0]
)

st.subheader("Faturamento por Produto")

faturamento_produto = (
    df_filtrado
    .groupby("nome_produto")["valor_total"]
    .sum()
    .reset_index()
)

st.bar_chart(
    faturamento_produto.set_index("nome_produto")
)