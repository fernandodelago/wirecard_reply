# wirecard - Respostas

Subi o modelo relacional das bases origens no meu entendimento. Criei este via MySQL WorkBench.
Foi divertido instalar o banco e colocar a ferramenta para funcionar conectada a ele via Ubuntu.

Há um arquivo .SQL que é a criação das tabelas no Hive no formato Parquet. Esse script foi testado e executado via container da Cloudera e rodou ok, via HUE.

O .SQL de create das tabelas no hive, deve ser executado no beeline com os devidos parâmetros de conexão no banco, passando a flag de leitura de arquivo.

Foram subidas para o repositório os arquivos .py desenvolvidos em Python. utilizei para criação o Jupyter Notebook pela simplicidade de se trabalhar.

Os scripts devem ser chamados via Shell com o comando: python3 <nome_do_script.py>

A idéia foi ir pela simplicidade, criando um arquivo de ingestão para cada tabela origem.

Outro approch que poderia ser feito, seria criar um Python dinâmico que identificação o nome das colunas na origem e realizasse a criação no destino com os formatos correspondentes. No entanto, este seria um pouco mais complexo de se desenvolver e para uma manutenção futura, outra pessoa com menos know-how teria problemas dar manutenção.

OBSERVAÇÃO: 
Não fiz o modelo dimensional, pois não tive a oportunidade de trabalhar com este tipo de modelo, então não tenho background para construir tal database. Cheguei a estudar alguns artigos e li alguns materiais sobre o assunto, mas no meu entendimento o desenho de um database como este é papel do Arquiteto de Dados e/ou Soluções, sendo o Data Engineer uma pessoa para consulta e opiniões sobre o desenho, não o responsável.
A responsábilidade do Data Enginer é a montagem do pipeline de dados, zelando pela integridade dos dados oriundos de suas origens e a transformação dos mesmos quando necessário.


Sem  mais.

Fernando Delago
