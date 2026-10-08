import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    // Aguarda 3 segundos
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Navega para a tela de login substituindo a Splash no histórico
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo escuro estilo Digimon
      body: Center(
        child: Image.asset(
          'assets/images/logo_digimon.png', // Substitua pela sua imagem
          width: 250,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}