CLASS zcl_z2ui5_proxy_kpi_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_z2ui5_proxy_kpi_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS /iwbep/if_mgw_appl_srv_runtime~get_entityset
        REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_z2ui5_proxy_kpi_dpc_ext IMPLEMENTATION.

  METHOD /iwbep/if_mgw_appl_srv_runtime~get_entityset.

    DATA lt_result TYPE zcl_z2ui5_proxy_kpi_mpc=>tt_entity.
    DATA(lt_filter_cond) = io_tech_request_context->get_filter( )->get_filter_select_options( ).

    TRY.
        DATA(lv_classname)   = to_upper( lt_filter_cond[ property = `CLASS` ]-select_options[ 1 ]-low ).
      CATCH cx_root.
        INSERT VALUE #( id = `ERROR_NO_PARAMETER_FOUND_WITH_NAME_CLASS` ) INTO TABLE lt_result.
        copy_data_to_ref( EXPORTING is_data = lt_result CHANGING cr_data = er_entityset ).
        RETURN.
    ENDTRY.

    TRY.
        DATA(lv_filter) = to_upper( lt_filter_cond[ property = `FILTER` ]-select_options[ 1 ]-low ).
      CATCH cx_root.
    ENDTRY.

    DATA li_proxy_kpi TYPE REF TO z2ui5_if_proxy_kpi.
    CREATE OBJECT li_proxy_kpi TYPE (lv_classname).
    DATA(lv_count) = li_proxy_kpi->count( lv_filter ).

    DO lv_count TIMES.
      INSERT VALUE #( id = sy-index ) INTO TABLE lt_result.
    ENDDO.

    copy_data_to_ref( EXPORTING is_data = lt_result CHANGING cr_data = er_entityset ).

  ENDMETHOD.

ENDCLASS.
