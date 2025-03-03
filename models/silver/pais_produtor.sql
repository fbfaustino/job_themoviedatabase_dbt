{{ config(
    materialized='incremental',
    unique_key=['id_filme', 'pais_produtor']
) }}

with pais_produtor as (
    select 
        id_filme,
        pais_produtor, 
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS
    from {{ source('bronze', 'pais_produtor') }}

    {% if is_incremental() %}
        WHERE TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') > (SELECT MAX(DATA_DADOS) FROM {{ this }})
    {% endif %}
)
select * from pais_produtor