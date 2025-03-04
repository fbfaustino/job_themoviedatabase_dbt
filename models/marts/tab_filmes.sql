{{ config(
    materialized='incremental',
    unique_key='id_filme'
) }}

with filmes as (
    select 
        a.id_filme, 
        a.nome as nome_filme,
        a.sinopse,
        a.popularidade,
        A.nota,
        TO_DATE(NULLIF(a.data_lancamento, ''), 'YYYY-MM-DD') AS data_lancamento,
        a.titulo_original,
        b.generos,
        c.palavra_chave_us || c.palavra_chave_br as palavras_chave,
        d.produtoras,
        e.pais_produtor,
        a.data_dados
    from {{ ref('int_filmes') }} a 
    left join {{ ref('int_generos') }} b on a.id_filme = b.id_filme
    left join {{ ref('int_palavras_chave') }} c on a.id_filme = c.id_filme
    left join {{ ref('int_produtora') }} d on a.id_filme = d.id_filme
    left join {{ ref('int_pais_produtor') }} e on a.id_filme = e.id_filme

    {% if is_incremental() %}
        WHERE a.data_dados > (SELECT MAX(data_dados) FROM {{ this }})
    {% endif %}
)
select * from filmes