select
    cod_colaborador,
    concat(primeiro_nome, " ", ultimo_nome) as nome_completo
from {{source("lighthouse-mayra", "colaboradores")}}
