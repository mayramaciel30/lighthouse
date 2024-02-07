select
    num_conta,
    cod_cliente,
    cod_agencia, 
    round(saldo_disponivel, 2) as saldo_disponivel
from {{source("lighthouse-mayra", "contas")}}