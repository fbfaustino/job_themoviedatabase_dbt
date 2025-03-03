with generos as (
    select 
        id id_genero, 
        nome nome_genero,
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS
    from {{ source('bronze', 'generos') }}
)
select * from generos