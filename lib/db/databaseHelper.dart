// import 'dart:async';
// import 'dart:typed_data';
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutter/widgets.dart';
//
// class Book {
//   final int id;
//   final String name;
//   final String address ;
//   final String comments ;
//
//   final Uint8List selfpicURL ;
//
//   final Uint8List sigURL ;
//   final String time ;
//
//   Book({
//     required this.id,
//     required this.name,
//     required this.address,
//     required this.comments,
//     required this.selfpicURL,
//     required this.sigURL,
//     required this.time,
//
//   });
//
//
// // Avoid errors caused by flutter upgrade.
// // Importing 'package:flutter/widgets.dart' is required.
//   final database = openDatabase (
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//       final path = join(await getDatabasesPath(), 'doggie_database.db'),
//   // When the database is first created, create a table to store dogs.
//       onCreate: (db, version) {
//   // Run the CREATE TABLE statement on the database.
//   return db.execute(
//   'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
//   );
//   },
//   // Set the version. This executes the onCreate function and provides a
//   // path to perform database upgrades and downgrades.
//   version: 1,
//   );
// }
//
// // A method that retrieves all the dogs from the dogs table.
// Future<List<Book>> books() async {
//   // Get a reference to the database.
//   final db = await database;
//
//   // Query the table for all The Dogs.
//   final List<Map<String, dynamic>> maps = await db.query('books');
//
//   // Convert the List<Map<String, dynamic> into a List<Dog>.
//   return List.generate(maps.length, (i) {
//     return Book(
//       id: maps[i]['id'],
//       name: maps[i]['name'],
//      // age: maps[i]['age'],
//     );
//   });
//}