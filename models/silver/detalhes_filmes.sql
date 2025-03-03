{{ config(
    materialized='incremental',
    unique_key='id_filme'
) }}

WITH filmes AS (
    SELECT 
        ID as id_filme,
        REVENUE as faturamento,
        BUDGET as orcamento,
        RUNTIME as duracao,
        POSTER_PATH as img_poster,
        IMDB_ID as nota_imdb,
        ORIGINAL_LANGUAGE as linguagem_original,
        ORIGINAL_TITLE as titulo_original,
        TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') as DATA_DADOS 
    FROM {{ source('bronze', 'detalhes_filmes') }}
    
    {% if is_incremental() %}
        WHERE TO_TIMESTAMP(DATA_DADOS, 'YYYY-MM-DD HH24:MI:SS') > (SELECT MAX(DATA_DADOS) FROM {{ this }})
    {% endif %}
)

SELECT * FROM filmes
