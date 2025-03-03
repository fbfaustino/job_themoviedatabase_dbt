with pais_produtor as (
    select 
        id_filme,
        pais_produtor, 
        data_dados 
    from {{ source('silver', 'pais_produtor') }}
)
select * from pais_produtor