import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//import 'package:latihan/models/models.dart';


class Model {
  int? id;
  String? nama, no_hp;

  Model({this.id, this.nama, this.no_hp});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json['id'], nama: json['nama'], no_hp: json['no_hp']);
  }
}
class DatabaseKontak {
  final String databaseName = "kontak.db";
  final int databaseVersion = 2;


  final String namaTabel = 'kontak';
  final String id = 'id';
  final String nama = 'nama';
  final String no_hp = 'no_hp';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE ${namaTabel} ($id INTEGER PRIMARY KEY, $nama TEXT NULL, $no_hp TEXT NULL)');
  }


  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(namaTabel, row);
    return query;
  }


Future<List<Model>> getAll() async {
    final data = await _database!.query(namaTabel);
    List<Model> result =
        data.map((e) =>Model.fromJson(e)).toList();
    return result;
  }

  Future<Database> _initDatabase() async {
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    String path = join(databaseDirectory.path, databaseName);
    print('database init');
    return openDatabase(path, version: databaseVersion, onCreate: _onCreate);
  }
}
