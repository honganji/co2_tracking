import 'package:co2_tracking/pages/base.dart';
import 'package:flutter/material.dart';
import 'pages/initial.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Define the path to the JSON file
  const String filePath = 'assets/json/data.json';
  final Map<String, dynamic> jsonData = await readJsonFile(filePath);
  storeJson(jsonData);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Almarai"),
      home: const Initial(),
      // home: Base(),
    );
  }
}

Future<Map<String, dynamic>> readJsonFile(String assetPath) async {
  // Load the JSON file from the assets
  final contents = await rootBundle.loadString(assetPath);

  // Decode the JSON
  final jsonData = jsonDecode(contents);
  return jsonData;
}

void storeJson(Map<String, dynamic> content) {
  print("length: ${content["department"].length}");
}
