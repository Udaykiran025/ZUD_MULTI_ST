CLASS zcl_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calc IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

  data : it_data type STANDARD TABLE OF zp_uk_student with DEFAULT KEY.

it_data = CORRESPONDING #( It_original_data ).

  LOOP AT it_data ASSIGNING FIELD-SYMBOL(<lfs_result>).
      IF ( <lfs_result>-AvgMarks > 50  ).
        <lfs_result>-Result_Status = 'Pass'.
      ELSE.
        <lfs_result>-Result_Status = 'Fail'.
      ENDIF.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( it_data ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
