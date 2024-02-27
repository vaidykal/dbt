import snowflake.snowpark.functions as F

def model(dbt, session):
    dbt.config(
        materialized="table"
    )

    df_store = dbt.ref("store_sf")
    df_store_sales = dbt.ref("store_sales_sf")

    df_final = (
        df_store
        .join (df_store_sales, df_store.s_store_sk==df_store_sales.ss_store_sk, "Inner")
        .group_by (df_store.s_store_name, df_store.s_country)
            .agg(
                F.sum(F.col('ss_sales_price')).alias('sales_price')
            )
    )

    return df_final

