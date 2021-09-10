import 'package:grisoftware_demo/models/short_links_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('links.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE links ( 
  id $idType, 
  original_link $textType,
  short_link $textType,  
  time $textType  
  )
''');
  }

  Future<ShortLinks> addLink(ShortLinks link) async {
    final db = await instance.database;

    final id = await db.insert('links', link.toJson());
    return link.copy(id: id);
  }

  Future<ShortLinks> readlink(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'links',
      columns: ['id', 'original_link', 'short_link', 'time'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ShortLinks.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ShortLinks>> readAllLinks() async {
    final db = await instance.database;
    final orderBy = 'time DESC';
    final result = await db.query('links', orderBy: orderBy);
    return result.map((json) => ShortLinks.fromJson(json)).toList();
  }

  Future<int> deleteLink(int id) async {
    final db = await instance.database;

    return await db.delete(
      'links',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
