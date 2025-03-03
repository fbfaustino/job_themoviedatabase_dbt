with palavras_chave as (
    select 
        id_filme,
        palavra_chave as PALAVRA_CHAVE_US,
        palavra_chave_br,
        data_dados 
    from {{ source('bronze', 'palavras_chave') }}

)
select * from palavras_chave
