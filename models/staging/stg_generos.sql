with generos as (
    select 
        id id_genero, 
        nome nome_genero 
    from {{ source('main', 'generos') }}
)
select * from generos