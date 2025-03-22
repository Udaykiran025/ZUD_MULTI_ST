@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view student root entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Zi_ud_studentroot
  as select from    I_Language
    left outer join zud_employee as zemployee on 1 = 1
  composition [0..*] of Zi_ud_student_m as _student
{
  key 1                         as RootId,
      max(zemployee.changed_at) as maxChangedat,
      _student // Make association public
}
where
  I_Language.Language = $session.system_language
