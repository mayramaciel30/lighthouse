select
    cod_proposta,
    cod_colaborador as fk_colaborador,
    cod_cliente as fk_cliente,
    cast(substr(data_entrada_proposta, 1, 10) as date) as data_proposta,
    round(valor_financiamento - valor_proposta, 2) as lucro_proposta
from {{source("lighthouse-mayra", "propostas_credito")}}