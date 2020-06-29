import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/content.dart';
import 'package:heroes/model/appuser.dart';

class GetconController extends ResourceController {
  GetconController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getContent() async {
    final contentQuery = Query<Content>(context); //从哪个database读取
    final contents = await contentQuery
        .fetch(); //The fetch() execution method returns a List<Hero>.

    return Response.ok(contents);
  }

  @Operation.get('qid')
  Future<Response> getContentByID(@Bind.path('qid') int qid) async {
    final contentQuery = Query<Content>(context)
      ..where((q) => q.id).equalTo(qid); //相当于sql的SELECT id,

    final content = await contentQuery
        .fetchOne(); //取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID.
    if (content == null) {
      return Response.notFound();
    } else {
      return Response.ok(content);
    }
  }
}
