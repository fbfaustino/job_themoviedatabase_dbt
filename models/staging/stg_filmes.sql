WITH filmes AS (
    SELECT 
        id id_filme,
        title AS nome_filme,
        overview AS sinopse,
        release_date data_lancamento
    FROM {{ source('bronze', 'filmes') }}  
)
SELECT * FROM filmes