@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for student'
@Metadata.ignorePropagatedAnnotations: true

@UI: { headerInfo: {
typeName: 'Student',
typeNamePlural: 'Students',
title: { type: #STANDARD, label: 'Student', value: 'StudentId'} }
}
define view entity ZC_ud_Student_m
  as projection on Zi_ud_student_m
{
      @UI.facet: [{
                           purpose: #STANDARD,
                           type: #IDENTIFICATION_REFERENCE,
                           label: 'StudentDetails'}]

      @UI.identification: [{ position: 10, label: 'Student ID' }]
      @UI.lineItem: [{ position: 10 , label: 'Student ID'}]
      @EndUserText.label: 'Student ID'
  key StudentId,
      RootId,
      @UI.identification: [{ position: 20, label: 'Student Name' }]
      @UI.lineItem: [{ position: 20 , label: 'Student Name'}]
      StudentName,
      @UI.identification: [{ position: 30, label: 'Age' }]
      @UI.lineItem: [{ position: 30 , label: 'Age'}]
      Age,
      @UI.identification: [{ position: 40, label: 'Class' }]
      @UI.lineItem: [{ position: 40 , label: 'Class'}]
      Class,
      @UI.identification: [{ position: 50, label: 'Class Section' }]
      @UI.lineItem: [{ position: 50 , label: 'Class Section'}]
      ClassSection,
      @UI.identification: [{ position: 60, label: 'AvgMarks' }]
      @UI.lineItem: [{ position: 60 , label: 'AvgMarks'}]
      AvgMarks,
      ChangedBy,
      LocalLastChangedAt,
      ChangedAt,
      /* Associations */
      _studentroot : redirected to parent Zc_ud_studentroot
}
