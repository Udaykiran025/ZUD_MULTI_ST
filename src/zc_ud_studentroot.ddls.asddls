@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for student root entity'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
typeName: 'Manage Student',
typeNamePlural: 'Studen Singleton',
title: {
type: #STANDARD,
value: 'RootId'

} }
define root view entity Zc_ud_studentroot
  as projection on Zi_ud_studentroot
{

      @UI.facet: [{
           purpose: #STANDARD             ,
           position: 10,
           label: 'Studen Multil inline Edit',
           type: #LINEITEM_REFERENCE,
           targetElement: '_student'
           }]

      @UI.lineItem: [{ position: 10 }]


  key RootId,
      maxChangedat,

      /* Associations */
      _student : redirected to composition child ZC_ud_Student_m
}
