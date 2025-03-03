with generos as (
    select 
        id_genero, 
        nome_genero 
    from {{ source('silver', 'generos') }}
)
select * from generos