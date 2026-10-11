import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';

void main() async {
  // Garante que o Flutter está pronto para executar código nativo antes do runApp
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa a conexão com o Firebase Authentication que configuramos
  await Firebase.initializeApp();

  runApp(const DigiMundoApp());
}

class DigiMundoApp extends StatelessWidget {
  const DigiMundoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiMundo Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
      ),
      // Define a SplashScreen como a primeira tela a ser exibida ao abrir o app
      home: const SplashScreen(),
    );
  }
}