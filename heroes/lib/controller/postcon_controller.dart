import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/content.dart';
import 'package:heroes/model/appuser.dart';

class PostconController extends ResourceController {
  PostconController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> storeContent(@Bind.body() Content inputContent) async {
    final postquery = Query<Content>(context)
  ..values = context as Content;
    final inputContent = await postquery.insert();

    return Response.ok(inputContent);
  }

    @Operation.put('id')
Future<Response> updateUser(@Bind.path('id') int id, @Bind.body() Content content) async {
  final query = Query<Content>(context)
    ..where((u) => u.id).equalTo(id)
    ..values = content;

  return Response.ok(await query.updateOne());
}
}