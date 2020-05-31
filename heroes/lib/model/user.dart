import "package:heroes/heroes.dart";
import 'package:aqueduct/managed_auth.dart';

import 'package:aqueduct/aqueduct.dart';


class User extends ManagedObject<_User> 
    implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input:true, output:false)//只能输入不能输出
  String password;//密码
}
class _User extends ResourceOwnerTableDefinition {
  @Column(unique:true)
  String email;
}





   
//class heroes extends ManagedObject<_Ctwz> implements _Ctwz {}

/*class _Ctwz {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;
}*/