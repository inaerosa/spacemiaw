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
    await collection.insertMany([
      {"name": "IBR", "points": 13}
    ]);
    print(await collection.find().toList());
  }
}
