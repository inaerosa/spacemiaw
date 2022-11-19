import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:test/dbHelper/constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    return collection;
  }

  static Future insert(dynamic name, dynamic points) async {
    var collection = await connect();
    await collection.insertMany([
      {"name": name, "points": points}
    ]);
  }

  static Future list() async {
    var collection = await connect();
    var results = await collection.find().toList();
    return results;
  }
}
