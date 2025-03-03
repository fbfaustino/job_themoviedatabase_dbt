{{ config(
    materialized='incremental',
    unique_key='id_filme'
) }}

WITH filmes AS (
    SELECT 
        ID as id_filme,
        TITLE as nome,
        OVERVIEW as sinopse,
        POPULARITY as popularidade,
        RELEASE_DATE as data_lancamento,
        VOTE_AVERAGE as nota,
        VOTE_COUNT as quantidade_votos,
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS
    FROM {{ source('bronze', 'filmes') }}  

    {% if is_incremental() %}
        WHERE TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') > (SELECT MAX(DATA_DADOS) FROM {{ this }})
    {% endif %}
)
SELECT * FROM filmes