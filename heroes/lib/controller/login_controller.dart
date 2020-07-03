import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/appuser.dart';

class LoginController extends ResourceController {
  LoginController(this.context);

  final ManagedContext context;

@Operation.get('username')
  Future<Response> getUserByID(@Bind.path('username') String uphone) async {
  final userQuery = Query<Appuser>(context)
    ..where((u) => u.username).equalTo("username");    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句
   
  final user = await userQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }


}