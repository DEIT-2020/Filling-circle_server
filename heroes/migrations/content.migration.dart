import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Content",
        [SchemaColumn("id", ManagedPropertyType.bigInteger,
         isPrimaryKey: true, 
         autoincrement: true, 
         isIndexed: false, 
         isNullable: false, 
         isUnique: false),


        SchemaColumn("qcontent", ManagedPropertyType.string, 
        isPrimaryKey: false,
        autoincrement: false, 
        isIndexed: false, 
        isNullable: false, 
        isUnique: false)]));

       database.addColumn("_Content", 
       SchemaColumn.relationship("checkby", ManagedPropertyType.bigInteger, 
       relatedTableName: 
       "_appuser", relatedColumnName: "id", 
       rule: DeleteRule.cascade, 
       isNullable: true, 
       isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    