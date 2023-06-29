import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hivedatabase/repository/remote/remote.dart';

import 'database/database.dart';
import 'model/amiibo.dart';

class Repository {
  late Database _database;
  late Remote _repository;

  Repository() {
    _database = Database();
    _repository = Remote();
  }

  Future<List<Amiibo>?> list() async {
    try {
      var list = await _database.list();
      if ((list?.length ?? 0) == 0) {
        var remoteList = await _repository.amiiboList();
        if (remoteList == null) {
          return null;
        } else {
          await _database.addAll(remoteList);
          return remoteList;
        }
      } else {
        return list;
      }
    } finally {
      print("Repository -> finish load list");
    }
  }

  Future<bool> listListener() async {
    try {
      var list = await _database.list();
      if ((list?.length ?? 0) == 0) {
        var remoteList = await _repository.amiiboList();
        if (remoteList == null) {
          return false;
        } else {
          await _database.addAll(remoteList);
          return true;
        }
      } else {
        return true;
      }
    } finally {
      print("Repository -> finish load list");
    }
  }

  Future<bool> favorite(Amiibo data) async {
    return _database.add(data);
  }

  Future<Amiibo?> details(int index) async {
    return null;
  }

  ValueListenable<Box<Amiibo>> listener() => _database.databaseListenable();

  ValueListenable<Box<Amiibo>> listenerFavorites() =>
      _database.databaseFavoritesListenable();

  clear() {
    _database.deleteAll();
  }

  removeFavorite(Amiibo data, int index) {
    _database.delete(index);
    // _database.deleteFromObject(data);
  }
}
