with produtora as (
    select 
        id_filme,
        produtora, 
        data_dados 
    from {{ source('silver', 'produtora') }}
)
select * from produtora