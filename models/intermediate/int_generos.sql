with generos as (
    select 
        a.id_filme,
        LISTAGG(b.nome_genero, ', ') WITHIN GROUP (ORDER BY b.nome_genero) AS generos
    from {{ ref('stg_generos_filmes') }} a
    inner join {{ ref('stg_generos') }}  b on a.id_genero = b.id_genero
    group by id_filme
)
select * from generos 