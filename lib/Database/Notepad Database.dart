import 'package:notepad/Model/Notepad.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotepadDatabase {
  static final NotepadDatabase instance = NotepadDatabase._init();

  static Database? _database;

  NotepadDatabase._init();

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('notepad.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE $tableNotes(
    ${NoteFields.id} $idType,
    ${NoteFields.isImportant}$boolType,
    ${NoteFields.number}$intType,
    ${NoteFields.title}$textType,
    ${NoteFields.description}$textType,
    ${NoteFields.time}$textType,    
    )
    
    
    ''');
  }

  Future<Notepad> create(Notepad notepad) async {
    final db = await instance.database;

    final id = await db?.insert(tableNotes, notepad.toJson());

    return notepad.copy(id: id);
  }

  Future<Notepad> readNotes(int id) async {
    final db = await instance.database;

    final maps = await db?.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [instance],
    );
    if (maps!.isNotEmpty) {
      return Notepad.fromJson(maps.first);
    } else {
      throw Exception('$id is not found');
    }
  }

  Future<List<Notepad>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NoteFields.time} ASC';
    final result = await db!.query(tableNotes, orderBy: orderBy);
    return result.map((json) => Notepad.fromJson(json)).toList();
  }

  Future<int> update(Notepad note) async {
    final db = await instance.database;
    return db!.update(tableNotes, note.toJson(), where: '${NoteFields.id}=?',
        whereArgs: [note.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db!.delete(
      tableNotes,
      where: '${NoteFields.id}=?',
      whereArgs: [id],
    );
  }
    Future close() async {
      final db = await instance.database;
      db?.close();
    }
  }
