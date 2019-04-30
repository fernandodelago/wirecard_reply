#!/usr/bin/env python
# coding: utf-8

# In[1]:


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


# In[2]:


print('######### INICIO DO PROGRAMA ##########')


# In[3]:


# usei para PARAR o SQLContext quando tinha que recarregar o contexto novamente
#sc.stop()


# In[4]:


# carregando os contextos necessários
sc = SparkContext("local", "import_table_from_mysql")
sqlContext = SQLContext(sc)
hive = HiveContext(sc)
hive.setConf("hive.exec.dynamic.partition", "true")
hive.setConf("hive.exec.dynamic.partition.mode", "nonstrict")


# In[5]:


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


# In[6]:


# Estabelecendo conexão
db = mysql.connector.Connect(**config)
cursor = db.cursor()


# In[7]:


# recuperando os dados do MYSQL e gravando em uma dataframe do PANDAS
df_test = pd.read_sql('SELECT * FROM channel', con=db)


# In[8]:


# print de verificação se os dados foram carregados
#print(df_test)


# In[9]:


# criando um dataframe do PySpark
df_spark = hive.createDataFrame(df_test)


# In[10]:


type(df_spark)


# In[12]:


# Colocando a opção de cache para ser mais rápido o acesso aos dados
df_spark.cache()


# In[13]:


# criando tabela temporária para trabalhar com os dados
df_spark.createOrReplaceTempView('tb_temp')


# In[14]:


# gravando em tabela no hive, usando como base a tabela temporária
df_insert = hive.sql("""insert into wirecard.channel                         select                           id, name, account_id                         from tb_temp""")


# In[15]:


# fecha conexão ao fim do processo
if(db.is_connected()):
        db.close()
        print("Fechada conexão com MySQL")


# In[16]:


# Exibição de dados de processamento
print('## Total de registros Processados ==> ' + str(df_spark.count()))


# In[17]:


print('######### FIM DO PROGRAMA ##########')


# # Fim do Programa
