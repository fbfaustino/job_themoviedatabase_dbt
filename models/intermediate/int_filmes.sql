with generos_filme as (
    select 
        a.id_filme, 
        a.nome_filme,
        a.sinopse, 
        c.nome_genero,
        a.data_lancamento
    from {{ ref('stg_filmes') }} a 
    inner join {{ ref('stg_generos_filmes') }} b 
        on a.id_filme = b.id_filme 
    inner join {{ ref('stg_generos') }} c 
        on c.id_genero = b.id_genero
)
select * from generos_filme