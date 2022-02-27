import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hiveproject/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constant/app_string.dart';

class CartDatabaseHelper{

  CartDatabaseHelper._();
  static final CartDatabaseHelper db=CartDatabaseHelper._();
  static Database ?_database;


  Future<Database?>get database async{
    if(_database!=null)return _database;
    _database=await initDb();
    return _database;
  }
  initDb()async{
    String path=join(await getDatabasesPath(),'CartProduct.db');
    return
      await openDatabase(
        path,version: 1,
        onCreate: (Database db ,int version)async{
          await db.execute('''
          CREATE TABLE $tableCartProduct(

      $columnPrice DOUBLE NOT NULL ,
      $columnImage TEXT NOT NULL,
      $columnName TEXT NOT NULL ,
      $columnProductId TEXT NOT NULL
       )''');
        }
      );
  }
  insert(CartProductModel model)async{
    var dbClient =await database;
    await dbClient!.insert(tableCartProduct, model.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>>getAllProduct()async{
    var dbClient =await database;
    List<Map> maps =await dbClient!.query(tableCartProduct);
    List<CartProductModel> list =maps.isNotEmpty?
    maps.map((product) => CartProductModel.fromJson(product)).toList()
        :[];
    return list;
  }
}