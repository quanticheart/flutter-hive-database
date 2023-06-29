import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedatabase/repository/model/amiibo.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

const String _databaseName = "amiibo";
const String _databaseNameFavorites = "amiibo_favorites";

class Database {
  late Box<Amiibo> database;
  late Box<Amiibo> databaseFavorites;

  Database() {
    open();
  }

  static init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(applicationDocumentDir.path);
    Hive.registerAdapter(AmiiboAdapter());
    Hive.registerAdapter(ReleaseAdapter());
    await Hive.openBox<Amiibo>(_databaseName);
    await Hive.openBox<Amiibo>(_databaseNameFavorites);
  }

  ValueListenable<Box<Amiibo>> databaseListenable() =>
      Hive.box<Amiibo>(_databaseName).listenable();

  ValueListenable<Box<Amiibo>> databaseFavoritesListenable() =>
      Hive.box<Amiibo>(_databaseNameFavorites).listenable();

  open() {
    database = Hive.box(_databaseName);
    databaseFavorites = Hive.box(_databaseNameFavorites);
  }

  addAll(List<Amiibo> list) async {
    try {
      database.addAll(list);
    } finally {}
  }

  Future<List<Amiibo>?> list() async {
    try {
      var data = database;
      if (data.length == 0) {
        return null;
      } else {
        List<Amiibo> list = data.values.toList();
        return list;
      }
    } finally {}
  }

  /// Favorites
  ///
  Future<bool> add(Amiibo item) async {
    try {
//       box.put('key', 'value');
// // key must be string or int and value could be any object (int, // String, List, Map, ..etc).
//       box.put('cites', ['Berlin', 'Vienna', 'Hamburg']);
//       box.put(123, 'Wow its a number');
//       box.putAll({'key1': 'value1', 1 : 'one'})
// // use for an existing index
//       box.putAt(int index, 'value');
// // create an automatically new index
//       box.add('value');
      var data = await databaseFavorites.add(item);
      return data > 0;
    } finally {}
  }

  // deletes the given key and data
  Future<void> deleteAll() async {
    try {
      // box.delete(‘key’);
      await databaseFavorites.clear();
      return;
    } finally {}
  }

  // deletes the given key and data
  Future<void> delete(int index) async {
    try {
      // box.delete(‘key’);
      await databaseFavorites.deleteAt(index);
      return;
    } finally {}
  }

  Future<void> deleteFromObject(Amiibo data) async {
    try {
      // box.delete(‘key’);
      await data.delete();
      return;
    } finally {}
  }

  // .get instruction return stored data at given key.
  // return default value in case of key does not exist
  Amiibo? get(int index) {
    try {
      // String name = box.get(‘key’, defaultValue: -1);
      var data = databaseFavorites.getAt(index);
      return data;
    } finally {}
  }

  Future<void> update(Amiibo item) async {
    try {
      await item.save();
      return;
    } finally {}
  }
}
