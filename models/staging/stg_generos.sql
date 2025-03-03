with generos as (
    select 
        id id_genero, 
        nome nome_genero 
    from {{ source('silver', 'generos') }}
)
select * from generos