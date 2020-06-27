import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Content",
        [SchemaColumn("contentId", ManagedPropertyType.bigInteger,
         isPrimaryKey: true, 
         autoincrement: true, 
         isIndexed: false, 
         isNullable: false, 
         isUnique: false),

         SchemaColumn("userid", ManagedPropertyType.string, 
         isPrimaryKey: true, 
         autoincrement: false, 
         isIndexed: false, 
         isNullable: false, 
         isUnique: false),

        SchemaColumn("content", ManagedPropertyType.string, 
        isPrimaryKey: false,
        autoincrement: false, 
        isIndexed: false, 
        isNullable: false, 
        isUnique: false)]));

       database.addColumn("_Content", 
       SchemaColumn.relationship("checkby", ManagedPropertyType.bigInteger, 
       relatedTableName: 
       "_userid", relatedColumnName: "userid", 
       rule: DeleteRule.cascade, 
       isNullable: true, 
       isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    