import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final Directory dbPath = await getApplicationDocumentsDirectory();
    final String path = join(dbPath.path, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    // Create categories table
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT
      )
    ''');

    // Create products table
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        oldPrice REAL,
        imagePath TEXT NOT NULL,
        categoryId INTEGER,
        salesCount INTEGER DEFAULT 0,
        isFavorite INTEGER DEFAULT 0,
        FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE CASCADE
      )
    ''');

    // Create packages table
    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        price REAL NOT NULL,
        duration INTEGER,
        packageType TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertCategory(Map<String, dynamic> category) async {
    final db = await database;
    return await db.insert('categories', category);
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    final db = await database;
    return await db.query('categories', orderBy: 'id DESC');
  }

  Future<Map<String, dynamic>?> getCategoryById(int id) async {
    final db = await database;
    final result = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> updateCategory(int id, Map<String, dynamic> category) async {
    final db = await database;
    return await db.update(
      'categories',
      category,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    return await db.insert('products', product);
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final db = await database;
    return await db.query('products', orderBy: 'id DESC');
  }

  Future<Map<String, dynamic>?> getProductById(int id) async {
    final db = await database;
    final result = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
    int categoryId,
  ) async {
    final db = await database;
    return await db.query(
      'products',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
  }

  Future<int> updateProduct(int id, Map<String, dynamic> product) async {
    final db = await database;
    return await db.update(
      'products',
      product,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertPackage(Map<String, dynamic> package) async {
    final db = await database;
    return await db.insert('packages', package);
  }

  Future<List<Map<String, dynamic>>> getAllPackages() async {
    final db = await database;
    return await db.query('packages', orderBy: 'id DESC');
  }

  Future<Map<String, dynamic>?> getPackageById(int id) async {
    final db = await database;
    final result = await db.query(
      'packages',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> updatePackage(int id, Map<String, dynamic> package) async {
    final db = await database;
    return await db.update(
      'packages',
      package,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deletePackage(int id) async {
    final db = await database;
    return await db.delete('packages', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearAllTables() async {
    final db = await database;
    await db.delete('products');
    await db.delete('categories');
    await db.delete('packages');
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
