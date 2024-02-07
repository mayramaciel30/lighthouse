with
    conta as (
        select num_conta,
            cod_cliente,
            cod_agencia
        from {{ref("dim_conta")}}
    ),
    tipo_transacao as (
        select 
            cod_tipo_transacao,
            cod_transacao
        from {{ref("dim_tipo_transacao")}}
    )

select
        cod_transacao,
        cast(substr(data_transacao, 1, 10) as date) as data_transacao,
        conta.num_conta as fk_conta,
        cod_cliente as fk_cliente,
        cod_agencia as fk_agencia,
        cod_tipo_transacao as fk_tipo_transacao,
        round(valor_transacao, 2) as valor_transacao
from {{source("lighthouse-mayra", "transacoes")}}
left join conta using (num_conta)
left join tipo_transacao using (cod_transacao)
