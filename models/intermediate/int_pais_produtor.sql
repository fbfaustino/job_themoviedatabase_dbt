with produtora as (
    select 
        id_filme,
        LISTAGG(pais_produtor, ', ') WITHIN GROUP (ORDER BY pais_produtor) AS pais_produtor
    from {{ ref('stg_pais_produtor') }}
    group by id_filme
)
select * from produtora