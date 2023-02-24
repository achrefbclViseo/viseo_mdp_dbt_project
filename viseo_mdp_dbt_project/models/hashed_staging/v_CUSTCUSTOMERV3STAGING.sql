{%- set yaml_metadata -%}
source_model: 
  datalake: CUSTCUSTOMERV3STAGING_
derived_columns:
  SOURCE: "!1"
  LOAD_DATETIME: "IngestionDate"
hashed_columns:
  CUSTOMER_HK: "CUSTOMERACCOUNT"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=false,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}


