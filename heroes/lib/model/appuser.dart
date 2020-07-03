import 'package:heroes/heroes.dart';

class Appuser extends ManagedObject<_Appuser> implements _Appuser {}

class _Appuser{
  @primaryKey
  String id;

  @Column(unique:true)
  String username;

  @Column(unique:true)
  String userpassword;
}