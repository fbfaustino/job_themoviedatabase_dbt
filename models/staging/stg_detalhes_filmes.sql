WITH filmes AS (
    SELECT 
        id_filme,
        faturamento,
        orcamento,
        duracao,
        img_poster,
        nota_imdb,
        linguagem_original,
        titulo_original,
        data_dados
    FROM {{ source('silver', 'detalhes_filmes') }}  
)
SELECT * FROM detalhes_filmes