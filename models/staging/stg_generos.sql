with generos as (
    select 
        id id_genero, 
        nome nome_genero 
    from {{ source('bronze', 'generos') }}
)
select * from generos