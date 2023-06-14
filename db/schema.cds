// Environment {ID: da1ab0bc-3845-429d-9f6b-6791db94f317, description: Join development 01 }
namespace z.APDJOENV01;

// Environment fields
type CC : String (10) @title: 'Cost center' @Analytics.Dimension ; /** "8d315b8f-cac2-4b64-af64-86b658512be3" */
type CC_Desc : String @title: 'Cost Center Description' @Analytics.Dimension ; /** "8c5d92e5-29be-47e4-9016-1b51a2fb8e45" */
type DEPT : String (10) @title: 'Department' @Analytics.Dimension ; /** "a809379f-6e17-4927-b8f6-efe69d6bf33e" */
type DEPT_Desc : String @title: 'Department Description' @Analytics.Dimension ; /** "6932fb21-8f9e-4d79-96f0-b17a707fd68d" */
type Attr1 : String (30) @title: 'Attribute 1' @Analytics.Dimension ; /** "4049564e-3dd2-47a6-8dd6-ca16d3173150" */
type Attr2 : String (30) @title: 'Attribute 2' @Analytics.Dimension ; /** "08316b60-c31b-46f0-885b-3c58cbdd0ca0" */
type CID : UUID @odata.Type: 'Edm.String' @title: 'GUID' @Analytics.Dimension ; /** "3dd5458d-3243-400f-b0e3-883b669d5b80" */
type ROW_ID : String @title: 'Row ID' @Analytics.Dimension ; /** "3dd5458d-3243-400f-b0e3-883b669d5b80" */
// Environment functions
/** {ID: "764169e8-072b-4745-ba90-d9ca0b7a1301"} */
@title: 'Cost center master'
@description: 'Cost center master'
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@UI.Identification : [{Value : CC}]
entity ME_CCMaster {
CC_Desc : CC_Desc ;
key CC : CC ;
Attr1 : Attr1 ;
};

/** {ID: "a7dd3ea8-56c6-4a7a-9bf6-20ef68cebe7a"} */
@title: 'Department Master'
@description: 'Department Master'
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@UI.Identification : [{Value : DEPT}]
entity ME_DEPTMaster {
DEPT_Desc : DEPT_Desc ;
key DEPT : DEPT ;
};

/** {ID: "8aea85da-93c2-4dc6-a90e-66446a884908"} */
@title: 'Sender 01'
@description: 'Sender 01'
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@UI.Identification : [{Value : CID}]
entity ME_Sender01 {
  key CID : CID ;
  CC : CC ;
  DEPT : DEPT ;
  Attr1 : Attr1 ;
  Attr2 : Attr2 ;
};

/** {ID: "81ad02a0-3dd6-481b-9246-1a0a4f9ccb4c", description: "Model Join LJIM Sender and Cost Center"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJ_LJIM_SenderCC as
    select coalesce(l.CID, '') as CID: CID, coalesce(nullIf(l.CC, ''), r.CC, '') as CC : CC,
    coalesce(l.DEPT, '') as DEPT: DEPT, coalesce(nullIf(l.Attr1, ''), r.Attr1, '') as Attr1 : Attr1,
    coalesce(l.Attr2, '') as Attr2: Attr2, coalesce(r.CC_Desc, '') as CC_Desc: CC_Desc
    from ME_Sender01 as l
    LEFT JOIN ME_CCMaster as r
    on l.CC = r.CC;

/** {ID: "b51cb44d-fa3c-4e16-8ace-8c9d0f8c75c8", description: "Model Join FJIM Sender and Cost Center"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJ_FJIM_SenderCC as
  select coalesce(l.CID, '') as CID: CID, coalesce(nullIf(l.CC, ''), r.CC, '') as CC : CC,
  coalesce(l.DEPT, '') as DEPT: DEPT, coalesce(nullIf(l.Attr1, ''), r.Attr1, '') as Attr1 : Attr1,
  coalesce(l.Attr2, '') as Attr2: Attr2, coalesce(r.CC_Desc, '') as CC_Desc: CC_Desc
  from ME_Sender01 as l
  FULL JOIN ME_CCMaster as r
  on l.CC = r.CC;

/** {ID: "14ffaedb-cf54-4601-be61-0b5230d5d014", description: "Model Join CJIM Sender and Cost Center"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJ_CJIM_SenderCC as
  select coalesce(l.CID, '') as CID: CID, coalesce(nullIf(l.CC, ''), r.CC, '') as CC : CC,
  coalesce(l.DEPT, '') as DEPT: DEPT, coalesce(nullIf(l.Attr1, ''), r.Attr1, '') as Attr1 : Attr1,
  coalesce(l.Attr2, '') as Attr2: Attr2, coalesce(r.CC_Desc, '') as CC_Desc: CC_Desc
  from ME_Sender01 as l
  CROSS JOIN ME_CCMaster as r ;

/** {ID: "517f08c8-69ee-4820-9bff-b4996fce4634", description: "Model Join IJIM Sender and Cost Center1"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJ_IJIM_SenderCC1 as
  select coalesce(l.CID, '') as CID: CID, coalesce(nullIf(l.CC, ''), r.CC, '') as CC : CC,
  coalesce(l.DEPT, '') as DEPT: DEPT, coalesce(nullIf(l.Attr1, ''), r.Attr1, '') as Attr1 : Attr1,
  coalesce(l.Attr2, '') as Attr2: Attr2, coalesce(r.CC_Desc, '') as CC_Desc: CC_Desc
  from ME_Sender01 as l
  INNER JOIN ME_CCMaster as r
  on l.CC = r.CC;

/** {ID: "81ad02a0-3dd6-481b-9246-1a0a4f9ccb4c", description: "Model Join LJIM Sender and Cost Center"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJ_LJIM_SenderCC2 as
    select key ROW_NUMBER() OVER () AS ROW_ID: ROW_ID, coalesce(l.CID, '') as CID: CID, coalesce(nullIf(l.CC, ''), r.CC, '') as CC : CC,
    coalesce(l.DEPT, '') as DEPT: DEPT, coalesce(nullIf(l.Attr1, ''), r.Attr1, '') as Attr1 : Attr1,
    coalesce(l.Attr2, '') as Attr2: Attr2, coalesce(r.CC_Desc, '') as CC_Desc: CC_Desc
    from ME_Sender01 as l
    LEFT JOIN ME_CCMaster as r
    on l.CC = r.CC;
