import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/main.dart';
import 'package:heroes/model/appuser.dart';
import 'package:heroes/model/content.dart';


//login,personal_center
class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;

@Operation.get('uid')
  Future<Response> getUserByID(@Bind.path('uid') int uid) async {
  final userQuery = Query<Appuser>(context)
    ..where((u) => u.id).equalTo(uid);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句
   
  final user = await userQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }


  @Operation.post()
  Future<Response> storeUser(@Bind.body() Appuser inputUser) async {
    final postquery = Query<Appuser>(context)
  ..values = inputUser;
    final insertedUser = await postquery.insert();

    return Response.ok(insertedUser);
  }
  
  @Operation.put('uid')
Future<Response> updateUser(@Bind.path('uid') int uid, @Bind.body() Appuser user) async {
  final query = Query<Appuser>(context)
    ..where((u) => u.id).equalTo(uid)
    ..values = user;

  return Response.ok(await query.updateOne());
}


  @Operation.get('uid','qid')
  Future<Response> storeUserstore(@Bind.path('uid') int uid,@Bind.path('qid') int qid) async {
   final contentQuery = Query<Content>(context)
    ..where((q) => q.id).equalTo(qid);    

  final contentn = await contentQuery.fetchOne();

  if (content == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(content);
    }


  }
  }