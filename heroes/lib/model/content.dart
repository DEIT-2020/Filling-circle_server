import 'package:heroes/heroes.dart';

class Content extends ManagedObject<_Content> implements _Content {}

class _Content {
  @primaryKey
  int id;

  @Column(unique: false)
  String qcontent;
}
