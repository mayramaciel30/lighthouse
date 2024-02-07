with 
    clientes as (
        select 
        cod_cliente, 
        data_nascimento
        from {{source("lighthouse-mayra", "clientes")}}
    ),

    contas as (
        select 
        cast(substr( data_ultimo_lancamento, 1, 10 ) as date) as data_ultimo_lancamento,
        cast( "2023-01-15" as date) as data_maxima,
        cod_cliente
        from {{source("lighthouse-mayra", "contas")}}
    )

select 
    clientes.cod_cliente,
    case 
        when {{datediff("data_ultimo_lancamento", "data_maxima", "month")}} > 3 then "inativo"
        else "ativo"
    end as status,
    {{datediff("data_nascimento", "data_maxima", "year")}} as idade,
    case
        when {{datediff("data_nascimento", "data_maxima", "year")}} < 31 then "A"
        when {{datediff("data_nascimento", "data_maxima", "year")}} < 46 then "B"
        when {{datediff("data_nascimento", "data_maxima", "year")}} < 61 then "C"
        else "D"
    end as faixa_etaria
from clientes left join contas using (cod_cliente)
