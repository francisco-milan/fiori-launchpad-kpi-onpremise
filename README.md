# launchpad-kpi

Features
* KPI Connector: Send KPIs of your abap2UI5 Apps to SAP Fiori Launchpad
* User-Friendly: Implement just a single interface and method to return the KPI value
* Project Consistency: Easily integrable with your abap2UI5 apps
* Compatibility: Runs with SAP Netweaver (v.7.30 or higher) or S/4 Private (Standard ABAP)

### Usage
1. The launchpad-kpi addons can be accesd via a single interface and method:
```abap
INTERFACE z2ui5_if_lp_kpi
  PUBLIC.

  METHODS count
    IMPORTING
      filter        TYPE string
    RETURNING
      VALUE(result) TYPE i.

ENDINTERFACE.
```
2. Include it into you app to return KPIs as shown here:
```abap
CLASS z2ui5_cl_lp_kpi_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES z2ui5_if_proxy_kpi.
    INTERFACES z2ui5_if_app.

ENDCLASS.

CLASS z2ui5_cl_proxy_kpi_hello_world IMPLEMENTATION.

  METHOD z2ui5_if_lp_kpi~count.
    "kpi calculation....
    result = 10.
  ENDMETHOD.

  METHOD z2ui5_if_app~main.
    "abap2UI5 app logic here...
  ENDMETHOD.

ENDCLASS.
```

3. Maintain the KPI at the Launchpad with the following endpoint:
`.../sap/opu/odata/sap/Z2UI5_PROXY_KPI_SRV/ENTITYCollection/$count?$filter=CLASS eq 'z2ui5_cl_proxy_kpi_hello_world'`


### Concept

###### Idea
<img width="700" alt="image" src="https://github.com/abap2UI5/abap2UI5-connector_launchpad_kpi/assets/102328295/c7db9e46-6876-40d8-a632-be79e2fbcb91">

###### Preview
<img width="621" alt="Pasted Graphic 3" src="https://github.com/abap2UI5/abap2UI5-connector_launchpad_kpi/assets/102328295/1b24c31e-5570-4324-92d0-5db915394ceb">

### Limitations & To-Do
* Implement and CDS/SADL bases OData Service for `ABAP for Cloud` compatibility

### Issues
For bug reports or feature requests, please open an issue in the [abap2UI5 repository.](https://github.com/abap2UI5/abap2UI5/issues)
