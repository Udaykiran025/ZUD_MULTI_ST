@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'student table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zi_ud_student_m
  as select from zud_student_m
  association to parent Zi_ud_studentroot as _studentroot on $projection.RootId = _studentroot.RootId
{
  key student_id            as StudentId,
      1                     as RootId,
      student_name          as StudentName,
      age                   as Age,
      class                 as Class,
      class_section         as ClassSection,
      avg_marks             as AvgMarks,
      @Semantics.user.lastChangedBy: true
      changed_by            as ChangedBy,
      //Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      //Total etag
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at            as ChangedAt,
      _studentroot
}
