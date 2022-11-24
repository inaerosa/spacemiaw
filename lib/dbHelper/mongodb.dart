import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:test/dbHelper/constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    var collection = db.collection(COLLECTION_NAME);
    return collection;
  }

  static Future insert(dynamic name, dynamic points) async {
    var collection = await connect();
    await collection.insertMany([
      {"name": name, "points": points}
    ]);
  }

  static Future<List<Map<String, dynamic>>> list() async {
    var collection = await connect();
    var results = await collection
        .find(where.limit(5).sortBy('points', descending: true))
        .toList();

    return results;
  }
}
