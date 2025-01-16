import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavouriteScreenController with ChangeNotifier {
  late Database _database;

  // List to hold favorite products in memory
  List<Map<String, dynamic>> _favourites = [];

  List<Map<String, dynamic>> get favourites => _favourites;

  // Initialize the database
  Future<void> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    _database = await openDatabase(
      join(dbPath, 'favourites.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE favourites(
            id INTEGER PRIMARY KEY,
            name TEXT,
            imageUrl TEXT,
            price REAL
          )
          ''',
        );
      },
      version: 1,
    );
    await loadFavourites();
  }

  // Load all favourite items from the database
  Future<void> loadFavourites() async {
    _favourites = await _database.query('favourites');
    notifyListeners();
  }

  // Add a product to favourites
  Future<void> addToFavourites(Map<String, dynamic> product) async {
    await _database.insert(
      'favourites',
      product,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await loadFavourites(); // Refresh the list
  }

  // Remove a product from favourites
  Future<void> removeFromFavourites(int id) async {
    await _database.delete(
      'favourites',
      where: 'id = ?',
      whereArgs: [id],
    );
    await loadFavourites(); // Refresh the list
  }

  // Check if a product is in favourites
  bool isFavourite(int id) {
    return _favourites.any((product) => product['id'] == id);
  }

  // Toggle favourite status
  Future<void> toggleFavourite(Map<String, dynamic> product) async {
    if (isFavourite(product['id'])) {
      // If the product is already in favorites, remove it
      await removeFromFavourites(product['id']);
    } else {
      // If the product is not in favorites, add it
      await addToFavourites(product);
    }
    notifyListeners(); // Update the UI
  }
}
