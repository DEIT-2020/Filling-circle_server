import "package:ctwz/ctwz.dart";

class Ctwz extends ManagedObject<_Ctwz> implements _Ctwz {}

class _Ctwz {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;
}