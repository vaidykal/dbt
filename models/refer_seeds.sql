with dialcode as (
    select * from {{ref('DialCode2')}}
)
select * from dialcode