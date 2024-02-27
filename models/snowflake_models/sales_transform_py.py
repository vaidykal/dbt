import snowflake.snowpark.functions as F

def model(dbt, session):
    df_base = session.sql("select * from prod.product")

    df_west = df_base.filter(F.col("Region")=='West')
    df_result = df_west.group_by("STATE").agg(F.sum(F.col("GLOBAL_SALES")).alias("GLOBAL_SALES"))
    return df_result