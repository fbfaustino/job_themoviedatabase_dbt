with produtora as (
    select 
        id_filme,
        LISTAGG(produtora, ', ') WITHIN GROUP (ORDER BY produtora) AS produtoras
    from {{ ref('stg_produtora') }}
    group by id_filme
)
select * from produtora