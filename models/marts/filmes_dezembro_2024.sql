{{
  config(
    materialized = 'incremental',
    unique_key = 'id_filme',
    )
}}
select * from  {{ ref('int_filmes') }}
where data_lancamento = '2023-01-01' 

