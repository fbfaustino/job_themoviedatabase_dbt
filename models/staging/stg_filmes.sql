WITH filmes AS (
    SELECT 
        id_filme,
        nome,
        sinopse,
        quantidade_votos,
        nota,
        popularidade,
        data_lancamento,
        data_dados
    FROM {{ source('silver', 'filmes') }}  
)
SELECT * FROM filmes