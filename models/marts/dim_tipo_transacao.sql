select
    cod_transacao,
    case
        when nome_transacao like "%Pix%" then "pix"
        else "convencional"
    end as tipo_transacao,
    case
        when nome_transacao like "%Pix%" then 1
        else 0
    end as cod_tipo_transacao
from {{source("lighthouse-mayra", "transacoes")}}