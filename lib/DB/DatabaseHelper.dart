import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/Employee.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  late Database _database;

  Future<Database> get database async {
    if (_database.isOpen) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'employee_database.db');
    return openDatabase(path, version: 1, onCreate: _createTable);
  }

  void _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employees(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        designation TEXT,
        address TEXT
      )
    ''');
  }

  Future<int> insertEmployee(Employee employee) async {
    Database db = await database;
    return await db.insert('employees', employee.toMap());
  }

  Future<List<Employee>> getEmployees() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('employees');
    return List.generate(maps.length, (i) {
      return Employee.fromMap(maps[i]);
    });
  }
}
