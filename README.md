Membros do trabalho:

Démetrio Webber;

Dionatha D Marchi;

Guilherme Dalazen;

Varlei de Cesare;

=====================================

A questões foram divididas da seguinte forma:

Dionatha:

  2. Criação de funções:
  
i. Sessões e Ingressos.

ii. Reservas de Assentos.

iii. Cliente e Pedidos.

Varlei:
  
  2. Criação de funções:
  
iv. Espetáculos e Reservas.

v. Espetáculos, Cidade, Cliente.

  3. Criar procedimentos para executar as seguintes ações/regras:
  
a.

b.

Demétrio:

3. Criar procedimentos para executar as seguintes ações/regras:

c.criar_pedido(in_data_pedido IN TIMESTAMP WITHOUT TIME ZONE, in_cod_cliente IN INT, out_codpedido INOUT INT)

d.criar_reserva(cod_espetaculo IN INT, cod_sessao IN INT, cod_pedido IN INT, cadeira IN VARCHAR(10))

4) Criar triggers:

a.Ao tentar inserir um registro na tabela RESERVA (BEFORE INSERT), testar se ainda existem ingressos disponíveis para determinada sessão, senão disparar exceção, abortando a operação.

b.Ao tentar excluir uma reserva (BEFORE DELETE)

Guilherme:

4) Criar triggers:

c. Gerar trigger de AFTER INSERT na tabela RESERVA que irá atualizar o campo 'ingressos_disponiveis' na tabela SESSOES, decrementando seu valor.

d. Gerar trigger de AFTER DELETE na tabela RESERVA que irá atualizar o campo 'ingressos_disponiveis' na tabela SESSAO, incrementando seu valor.

e. Ao tentar excluir pedido (BEFORE DELETE)
  + Com base no código do pedido deverá mudar o 'status' para inativado, bem como suas reservas associadas deverão ser excluídas. Preencher o campo data_cancelamento na tabela pedido com a data atual ( now() ).

f. Ao tentar excluir cliente (BEFORE DELETE):
  + Irá garantir que nenhum cliente seja excluído, informando que um cliente pode apenas ter o status modificado. Deverá informar ao usuário caso o cliente possua pedidos ativos, assim não podendo ser inativado. 
    * Para parar a execução, basta disparar uma exceção.
