with generos_filmes as (
    select 
        id_filme, 
        id_genero 
    from {{ source('bronze', 'generos_filmes')}}  
)
select * from generos_filmes