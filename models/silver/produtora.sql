{{ config(
    materialized='incremental',
    unique_key= ['id_filme', 'produtora']
) }}

with produtora as (
    select 
        id_filme,
        produtora, 
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS 
    from {{ source('bronze', 'produtora') }}
    
    {% if is_incremental() %}
        WHERE TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') > (SELECT MAX(DATA_DADOS) FROM {{ this }})
    {% endif %}
)
select * from produtora