import 'dart:io';

import 'package:flutterapp/models/invoice.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "ignite.db";
  static final _databaseVersion = 1;

  static final table = 'invoice';

//  static final id = 'id';
//  static final primary_name = 'primary_name';
//  static final barcode = 'barcode';

  String Id ='Id';
  String TenantId ='TenantId';
  String CustomerId= 'CustomerId';
  String ProductId= 'ProductId';
  String Quantity= 'Quantity';
  String NetAmount= 'NetAmount';
  String CustomerName= 'CustomerName';
  String CustomerCode= 'CustomerCode';
  String ProductName= 'ProductName';
  String ProductBarcode= 'ProductBarcode';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    print('database');
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print(path);
    print(_databaseName);
    await deleteDatabase(path); // just for testing
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $Id TEXT PRIMARY KEY,
            $TenantId Int NULL,
            $CustomerId TEXT  NULL,
            $ProductId TEXT  NULL,
            $Quantity Int,
            $NetAmount Double,
            $CustomerName TEXT  NULL,
            $CustomerCode TEXT  NULL,
            $ProductName TEXT  NULL,
            $ProductBarcode TEXT  NULL
          )
          ''');

  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(invoice data) async {
    Database db = await instance.database;
    return await db.insert(table, data.toMap());
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map< String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String _id = row[Id];
    return await db.update(table, row, where: '$Id = ?', whereArgs: [_id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$id = ?', whereArgs: [id]);
  }


  Future<List<invoice>> getInvcoieList() async {


    var MapList = await queryAllRows(); // Get 'Map List' from database
    int count = MapList.length;         // Count the number of map entries in db table


    List<invoice> list = List<invoice>();

    for (int i = 0; i < count; i++) {
      list.add(invoice.fromMapObject(MapList[i]));
    }


    return list;
  }
}