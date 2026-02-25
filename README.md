# 📊 E-commerce Analytics Pipeline

Projeto completo de **Análise de Dados** que simula um ambiente real de empresa, desde dados brutos até visualização interativa, utilizando **MySQL, SQL, Python, Streamlit e Git**.

O objetivo é demonstrar domínio de **engenharia analítica**, organização de dados em camadas (**Bronze / Silver / Gold**) e construção de **dashboards interativos** para tomada de decisão.

---

Arquitetura do Projeto

O projeto segue uma arquitetura moderna de dados:

### 🔹 Bronze
- Dados brutos (CSV)
- Sem tratamento
- Representa a origem dos dados

### 🔹 Silver
- Dados tratados e normalizados
- <img width="1900" height="1021" alt="Criando e polulando a camada silver apartir da bronze" src="https://github.com/user-attachments/assets/50916a14-0e38-4fa4-8c5d-8e1792f11fe4" />
- <img width="1339" height="940" alt="populando a camada silver pegando da bronze " src="https://github.com/user-attachments/assets/07669cf7-9200-4214-b716-80b431668d8b" />
- <img width="1512" height="1016" alt="Confirmando que os dados estao batendo certo" src="https://github.com/user-attachments/assets/41f726b1-46c9-4524-8d7b-5eaf64ebd39c" />

- Tipos corrigidos
- Relacionamentos (PK / FK)
- Prontos para análise

### 🔹 Gold
- Views analíticas
- <img width="1199" height="965" alt="Criando a camada gold como views" src="https://github.com/user-attachments/assets/b0ed18a8-59a6-4021-ba33-87799a68f3d8" />
- Métricas de negócio
- Camada otimizada para consumo por BI / Python

### 🔹 Python
- conexão
- <img width="1264" height="403" alt="ConexaoBD01" src="https://github.com/user-attachments/assets/4e924c93-4291-4404-b164-55437f0a18f2" />
-<img width="1166" height="439" alt="TesteConexao" src="https://github.com/user-attachments/assets/4c83578a-6e45-4388-9454-fbd25128d4ec" />
- Consumo de dados das camadas Silver e Gold
- <img width="1594" height="987" alt="Adicionando toda nossa consulta da tabela gold para o python" src="https://github.com/user-attachments/assets/7179fe1b-8cc7-430c-b275-61f4956af022" />
- Execução de consultas SQL diretamente no Python
- <img width="1582" height="995" alt="consultas da tabela gold" src="https://github.com/user-attachments/assets/a0cdfd2d-2677-4c0c-8446-75d2518c272a" />
- <img width="1603" height="924" alt="ImportandoTabelaDeuCerto" src="https://github.com/user-attachments/assets/ae63aace-c5cc-4fec-b0c4-dbc3e03af016" />
- Preparação dos dados para visualização
- <img width="1607" height="990" alt="CriandosOsGraficosWeb" src="https://github.com/user-attachments/assets/da2d260e-2051-47f4-a496-7a747f8ba87c" />
- Camada responsável pela integração entre banco de dados e dashboard
- <img width="1581" height="956" alt="notebookDe analise consumindo Gold" src="https://github.com/user-attachments/assets/2313c12e-a13b-4e8b-a256-a0f4e12fe84c" />
- dashboard
- ![dash_sem_filtro](https://github.com/user-attachments/assets/dff6f8d5-eaf4-4f18-ba7d-fe39309d249d)
- <img width="1895" height="663" alt="dash_filtros" src="https://github.com/user-attachments/assets/1451120d-5971-4cd6-b4d4-3390debb12e4" />
---

## 📂 Estrutura de Pastas

```text
e-commerce/
├── data/
│   └── raw/                # CSVs originais
├── sql/
│   ├── bronze/             # Criação das tabelas bronze
│   ├── silver/             # Limpeza e transformação
│   └── gold/               # Views analíticas
├── python/
│   ├── app.py              # Dashboard Streamlit
│   └── db_connection.py    # Conexão com MySQL
├── docs/                   # Documentação
├── outputs/                # Outputs e resultados
└── README.md

 Tecnologias Utilizadas

MySQL – Armazenamento e modelagem relacional

SQL – Transformações e views analíticas

Python – Consumo e manipulação de dados

Pandas – Análise de dados

Streamlit – Dashboard interativo

Git & GitHub – Versionamento e controle de código

código

** Dashboard **

O dashboard foi desenvolvido em Streamlit, consumindo dados da camada Silver / Gold, com:

Filtros dinâmicos por:

Ano

Mês

Produto

KPIs:

Faturamento

Quantidade vendida

Total de registros

Gráficos interativos:

Faturamento por produto

--Como Executar o Projeto
1-Clonar o repositório
git clone https://github.com/LucasSangiorge/e-commerce.git
cd e-commerce
2-Configurar o banco de dados

Criar o banco no MySQL

Executar os scripts SQL na ordem:

Bronze

Silver

Gold

3️-Instalar dependências
pip install pandas streamlit mysql-connector-python
4️-Executar o dashboard
cd python
streamlit run app.py

Objetivo do Projeto

Este projeto foi criado com foco em:

Portfólio profissional

Simulação de ambiente corporativo

Consolidação de conhecimentos em Análise de Dados

Boas práticas de arquitetura e versionamento

 Autor

Lucas Sangiorge
Analista de Dados em formação
Experiência em gestão, logística e suporte técnico
Foco em SQL, Python, Power BI e Engenharia Analítica
