{{ config(
    materialized='incremental',
    unique_key= ['id_filme', 'palavra_chave']
) }}

with palavras_chave as (
    select 
        ID_FILME,
        PALAVRA_CHAVE,
        PALAVRA_CHAVE_BR,
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS 
    from {{ source('bronze', 'palavras_chave') }}

    {% if is_incremental() %}
        WHERE TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') > (SELECT MAX(DATA_DADOS) FROM {{ this }})
    {% endif %}
)
select * from palavras_chave
