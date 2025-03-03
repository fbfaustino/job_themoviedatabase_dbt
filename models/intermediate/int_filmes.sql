
with filmes as (
    select 
        a.id_filme, 
        a.nome, 
        a.sinopse, 
        a.popularidade,
        a.quantidade_votos,
        a.nota, 
        a.data_lancamento, 
        b.titulo_original, 
        b.linguagem_original,
        a.data_dados
    from {{ ref('stg_filmes') }} a
    inner join {{ ref('stg_detalhes_filmes') }} b on a.id_filme = b.id_filme
)
select * from filmes