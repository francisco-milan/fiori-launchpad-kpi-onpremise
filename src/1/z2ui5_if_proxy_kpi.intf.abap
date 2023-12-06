INTERFACE z2ui5_if_proxy_kpi
  PUBLIC.

  METHODS count
    IMPORTING
      filter           TYPE string
    RETURNING
      VALUE(result) TYPE i.

ENDINTERFACE.
