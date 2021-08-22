
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
 import 'package:visitors_book/sql/notes.dart';

class BookDatabase {
  static final BookDatabase instance = BookDatabase._init();

  static Database? _database;

  BookDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('books.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableBook ( 
  ${BookFields.id} $idType, 
  ${BookFields.name} $textType,
  ${BookFields.comments} $textType,
  ${BookFields.address} $textType,
 

  ${BookFields.createdTime} $textType
  )
''');
  }

  Future<Book> create(Book book) async {
    final db = await instance.database;


    final id = await db.insert(tableBook, book.toJson());
    return book.copy(id: id);
  }

  Future<Book> readBook(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableBook,
      columns: BookFields.values,
      where: '${BookFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Book.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Book>> readAllBooks() async {
    final db = await instance.database;

    final orderBy = '${BookFields.createdTime} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableBook, orderBy: orderBy);

    return result.map((json) => Book.fromJson(json)).toList();
  }

  Future<int> update(Book book) async {
    final db = await instance.database;

    return db.update(
      tableBook,
      book.toJson(),
      where: '${BookFields.id} = ?',
      whereArgs: [book.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableBook,
      where: '${BookFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}