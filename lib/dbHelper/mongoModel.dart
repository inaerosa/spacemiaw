import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoModel mongoModelFromJson(String str) =>
    MongoModel.fromJson(json.decode(str));

String mongoModelToJson(MongoModel data) => json.encode(data.toJson());

class MongoModel {
  MongoModel({required this.id, required this.name, required this.points});

  ObjectId id;
  String name;
  int points;

  factory MongoModel.fromJson(Map<String, dynamic> json) =>
      MongoModel(id: json["_id"], name: json["name"], points: json["points"]);

  Map<String, dynamic> toJson() => {"_id": id, "name": name, "points": points};
}
