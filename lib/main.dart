import 'package:flutter/material.dart';

import 'dbHelper/mongodb.dart';
import 'views/myApp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}
