using {z.APDJOENV01 as mydb} from '../db/schema';

// Environment {ID: da1ab0bc-3845-429d-9f6b-6791db94f317, description: Join development 01 }
namespace z.APDJOENV01;

service z {

  @odata.draft.enabled
  @cds.redirection.target
  entity APDJOENV01_ME_CCMaster as projection on mydb.ME_CCMaster;

  @odata.draft.enabled
  @cds.redirection.target
  entity APDJOENV01_ME_DEPTMaster as projection on mydb.ME_DEPTMaster;

  @odata.draft.enabled
  @cds.redirection.target
  entity APDJOENV01_ME_Sender01 as projection on mydb.ME_Sender01;

  @readonly
  entity APDJOENV01_MJ_LJIM_SenderCC as projection on mydb.MJ_LJIM_SenderCC;

  @readonly
  entity APDJOENV01_MJ_FJIM_SenderCC as projection on mydb.MJ_FJIM_SenderCC;

  @readonly
  entity APDJOENV01_MJ_CJIM_SenderCC as projection on mydb.MJ_CJIM_SenderCC;

  @readonly
  entity APDJOENV01_MJ_IJIM_SenderCC1 as projection on mydb.MJ_IJIM_SenderCC1;

}