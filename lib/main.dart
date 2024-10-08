import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market/widgetTree.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: dotenv.env['API_KEY']!,
    appId: dotenv.env['APP_ID']!,
    messagingSenderId: dotenv.env['SENDER_ID']!,
    projectId: dotenv.env['PROJECT_ID']!,
    storageBucket: dotenv.env['STORAGE_BUCKET']!,
  )
  );
  // Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WidgetTree(),
    );
  }
}