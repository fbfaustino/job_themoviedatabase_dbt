with palavras_chave as (
    select 
        id_filme,
        LISTAGG(palavra_chave_us, ', ') WITHIN GROUP (ORDER BY palavra_chave_us) AS palavra_chave_us,
        LISTAGG(palavra_chave_br, ', ') WITHIN GROUP (ORDER BY palavra_chave_br) AS palavra_chave_br
    from {{ ref('stg_palavras_chave') }}
    group by id_filme
)
select * from palavras_chave 