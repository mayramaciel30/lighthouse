select
    cod_agencia,
    tipo_agencia,
    nome
from {{source("lighthouse-mayra", "agencias")}}