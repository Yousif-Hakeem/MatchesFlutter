import 'package:flutter_application_2/Model/constants.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  Future<Database> initializeDb() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, 'Worlds.db');
    return openDatabase(databasePath, version: 1, onCreate: (db, version) {
      db.execute('''
      CREATE TABLE $matchesTable(
        firstTeam TEXT,
        secondTeam TEXT,
        duration INTEGER,
        location TEXT
      )
    ''');
    });
  }

  Future<void> insertData(TheMatches c) async {
    Database db = await initializeDb();
    await db.insert(matchesTable, c.toMap());

    print("saved successfully");
  }

  Future<List<TheMatches>> getFromDb() async {
    try {
      Database db = await initializeDb();
      List<Map<String, dynamic>> data = await db.query(matchesTable);

      List<TheMatches> matches = data.map((e) {
        TheMatches newMatch = TheMatches.fromMap(e);
        return newMatch;
      }).toList();
      print('data fetched successfully');
      return matches;
    } catch (error) {
      print('data failed to be retrieved');
      return [];
    }
  }

  Future<void> deleteMatch(int? duration) async {
    Database db = await initializeDb();
    await db.delete(
      matchesTable,
      where: 'duration = ?',
      whereArgs: [duration],
    );
  }

  Future<void> updateMatch(TheMatches match) async {
    Database db = await initializeDb();
    await db.update(
      matchesTable,
      match.toMap(),
      where: 'duration = ?',
      whereArgs: [match.duration],
    );
  }
}
