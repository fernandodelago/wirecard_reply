#!/usr/bin/env python
# coding: utf-8

# In[2]:


#!usr/bin/env python
#-*- coding:utf-8 -*-
'''
Esse programa visa ler dados de tabelas no MySQL e carregar em tabelas dentro do Hive
'''
# importacao de pacotes
from pyspark.sql.types import *
from pyspark.sql import *
from pyspark import SQLContext, SparkContext
import argparse
import sys
import mysql.connector
import pandas as pd


# In[3]:


print('######### INICIO DO PROGRAMA ##########')


# In[4]:


# usei para PARAR o SQLContext quando tinha que recarregar o contexto novamente
#sc.stop()


# In[5]:


# carregando os contextos necessários
sc = SparkContext("local", "import_table_from_mysql")
sqlContext = SQLContext(sc)
hive = HiveContext(sc)
hive.setConf("hive.exec.dynamic.partition", "true")
hive.setConf("hive.exec.dynamic.partition.mode", "nonstrict")


# In[6]:


# Dados de conexão
config = {
    'host': 'localhost',
    'port': 3306,
    'database': 'wirecard_db',
    'user': 'root',
    'password': 'x1mog72p',
    'charset': 'utf8',
    'use_unicode': True,
    'get_warnings': True,
}


# In[7]:


# Estabelecendo conexão
db = mysql.connector.Connect(**config)
cursor = db.cursor()


# In[8]:


# recuperando os dados do MYSQL e gravando em uma dataframe do PANDAS
df_test = pd.read_sql('SELECT * FROM accounts_channels', con=db)


# In[9]:


# print de verificação se os dados foram carregados
#print(df_test)


# In[10]:


# criando um dataframe do PySpark
df_spark = hive.createDataFrame(df_test)


# In[11]:


type(df_spark)


# In[12]:


# Colocando a opção de cache para ser mais rápido o acesso aos dados
df_spark.cache()


# In[13]:


# criando tabela temporária para trabalhar com os dados
df_spark.createOrReplaceTempView('tb_temp')


# In[17]:


# gravando em tabela no hive, usando como base a tabela temporária
df_insert = hive.sql("""insert into wirecard.accounts_channels                         select                           channel_id, account_id                         from tb_temp""")


# In[14]:


# fecha conexão ao fim do processo
if(db.is_connected()):
        db.close()
        print("Fechada conexão com MySQL")


# In[15]:


# Exibição de dados de processamento
print('## Total de registros Processados ==> ' + str(df_spark.count()))


# In[16]:


print('######### FIM DO PROGRAMA ##########')


# # Fim do Programa
