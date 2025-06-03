import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:immunowarriors/login_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // Assure la connexion et l'initialisation aux différents services externes
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Hive avec le bon dossier de stockage
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  // Ouvrir une box (boîte de stockage clé/valeur)
  await Hive.openBox('myBox');

  // Initialise la connexion à la Firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Firebase Login',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}