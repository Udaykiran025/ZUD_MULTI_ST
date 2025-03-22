CLASS zcl_student_m DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_student_m IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_student TYPE STANDARD TABLE OF zud_student_m WITH EMPTY KEY,
          lt_marks TYPE STANDARD TABLE OF zud_marks WITH EMPTY KEY,
          lt_assessment TYPE STANDARD TABLE OF zuk_assessment WITH EMPTY KEY,
          lt_subjects   TYPE STANDARD TABLE OF zuk_subjects WITH EMPTY KEY.


    TRY.
        " Create test data for zuk_student
        lt_student = VALUE #(
       ( student_id = 'S0001' student_name = 'John Doe'       age = '15' class = '10' class_section = 'A' avg_marks = '78.50' )
       ( student_id = 'S0002' student_name = 'Alice Smith'    age = '14' class = '09' class_section = 'B' avg_marks = '82.30' )
          ).

        " Delete existing entries in zuk_student and insert new data
        DELETE FROM zud_student_m.
        INSERT zud_student_m FROM TABLE @lt_student.
        out->write( |{ sy-dbcnt } entries in zuk_student modified| ).

        " Create test data for zuk_marks )
        lt_marks = VALUE #(
         " John Doe (S0001) marks
          ( student_id = 'S0001' assessment_id = '01' subject_id = 'ENG' marks_obtained = '75.00' )
          ( student_id = 'S0001' assessment_id = '01' subject_id = 'SAN' marks_obtained = '80.00' )
          ( student_id = 'S0001' assessment_id = '01' subject_id = 'MAT' marks_obtained = '78.00' )
          ( student_id = 'S0001' assessment_id = '01' subject_id = 'PHY' marks_obtained = '79.00' )
          ( student_id = 'S0001' assessment_id = '01' subject_id = 'CHE' marks_obtained = '80.00' )
          ( student_id = 'S0001' assessment_id = '02' subject_id = 'ENG' marks_obtained = '76.00' )
          ( student_id = 'S0001' assessment_id = '02' subject_id = 'SAN' marks_obtained = '82.00' )
          ( student_id = 'S0001' assessment_id = '02' subject_id = 'MAT' marks_obtained = '77.00' )
          ( student_id = 'S0001' assessment_id = '02' subject_id = 'PHY' marks_obtained = '78.00' )
          ( student_id = 'S0001' assessment_id = '02' subject_id = 'CHE' marks_obtained = '79.00' )
          ( student_id = 'S0001' assessment_id = '03' subject_id = 'ENG' marks_obtained = '80.00' )
          ( student_id = 'S0001' assessment_id = '03' subject_id = 'SAN' marks_obtained = '81.00' )
          ( student_id = 'S0001' assessment_id = '03' subject_id = 'MAT' marks_obtained = '79.00' )
          ( student_id = 'S0001' assessment_id = '03' subject_id = 'PHY' marks_obtained = '80.00' )
          ( student_id = 'S0001' assessment_id = '03' subject_id = 'CHE' marks_obtained = '81.00' )

          " Alice Smith (S0002) marks
          ( student_id = 'S0002' assessment_id = '01' subject_id = 'ENG' marks_obtained = '85.00' )
          ( student_id = 'S0002' assessment_id = '01' subject_id = 'SAN' marks_obtained = '88.00' )
          ( student_id = 'S0002' assessment_id = '01' subject_id = 'MAT' marks_obtained = '82.00' )
          ( student_id = 'S0002' assessment_id = '01' subject_id = 'PHY' marks_obtained = '83.00' )
          ( student_id = 'S0002' assessment_id = '01' subject_id = 'CHE' marks_obtained = '84.00' )
          ( student_id = 'S0002' assessment_id = '02' subject_id = 'ENG' marks_obtained = '86.00' )
          ( student_id = 'S0002' assessment_id = '02' subject_id = 'SAN' marks_obtained = '85.00' )
          ( student_id = 'S0002' assessment_id = '02' subject_id = 'MAT' marks_obtained = '81.00' )
          ( student_id = 'S0002' assessment_id = '02' subject_id = 'PHY' marks_obtained = '82.00' )
          ( student_id = 'S0002' assessment_id = '02' subject_id = 'CHE' marks_obtained = '83.00' )
          ( student_id = 'S0002' assessment_id = '03' subject_id = 'ENG' marks_obtained = '87.00' )
          ( student_id = 'S0002' assessment_id = '03' subject_id = 'SAN' marks_obtained = '89.00' )
          ( student_id = 'S0002' assessment_id = '03' subject_id = 'MAT' marks_obtained = '84.00' )
          ( student_id = 'S0002' assessment_id = '03' subject_id = 'PHY' marks_obtained = '85.00' )
          ( student_id = 'S0002' assessment_id = '03' subject_id = 'CHE' marks_obtained = '86.00' )
           ).

        " Delete existing entries in zuk_marks and insert new data
        DELETE FROM zud_marks.
        INSERT zud_marks FROM TABLE @lt_marks.
        out->write( |{ sy-dbcnt } entries in zuk_marks modified| ).

*         " Create test data for zuk_assessment
        lt_assessment = VALUE #(
          ( assessment_id = '1' assessment_name = 'Assessment 1' )
          ( assessment_id = '2' assessment_name = 'Assessment 2' )
          ( assessment_id = '3' assessment_name = 'Assessment 3' )
        ).

        " Delete existing entries in zuk_assessment and insert new data
        DELETE FROM zuk_assessment.
        INSERT zuk_assessment FROM TABLE @lt_assessment.
        out->write( |{ sy-dbcnt } entries in zuk_assessment modified| ).

        " Create test data for zuk_subjects
        lt_subjects = VALUE #(
          ( subject_id = 'ENG' subject_name = 'English' )
          ( subject_id = 'SAN' subject_name = 'Sanskrit' )
          ( subject_id = 'MAT' subject_name = 'Mathematics' )
          ( subject_id = 'PHY' subject_name = 'Physics' )
          ( subject_id = 'CHE' subject_name = 'Chemistry' )
        ).

        " Delete existing entries in zuk_subjects and insert new data
        DELETE FROM zuk_subjects.
        INSERT zuk_subjects FROM TABLE @lt_subjects.
        out->write( |{ sy-dbcnt } entries in zuk_subjects modified| ).

        COMMIT WORK.
      CATCH cx_uuid_error.

    ENDTRY.


  ENDMETHOD.
ENDCLASS.
