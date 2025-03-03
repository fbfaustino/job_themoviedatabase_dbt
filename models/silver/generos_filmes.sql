{{ config(
    materialized='incremental',
    unique_key= ['id_filme', 'id_genero']
) }}

with generos_filmes as (
    select 
        id_filme, 
        id_genero,
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS
    from {{ source('bronze', 'generos_filmes')}}  

    {% if is_incremental() %}
        WHERE TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') > (SELECT MAX(DATA_DADOS) FROM {{ this }})
    {% endif %}
)
select * from generos_filmes