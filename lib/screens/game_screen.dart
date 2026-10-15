import 'dart:async';
import 'package:flutter/material.dart';
import '../models/digimon_model.dart';
import 'select_screen.dart';

class GameScreen extends StatefulWidget {
  final DigimonModel selectedDigimon;

  const GameScreen({super.key, required this.selectedDigimon});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isEvolved = false;
  int secondsElapsed = 0;
  Timer? _gameTimer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondsElapsed++;

        // Aos 120 segundos (2 minutos), o Digimon evolui automaticamente
        if (secondsElapsed == 120) {
          isEvolved = true;
        }

        // Aos 300 segundos (5 minutos), o jogador vence a partida
        if (secondsElapsed >= 300) {
          _gameTimer?.cancel();
          _showWinDialog();
        }
      });
    });
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2A38),
        title: const Text('VITÓRIA!', style: TextStyle(color: Colors.orangeAccent)),
        content: Text('Parabéns! Você sobreviveu e evoluiu para o poderoso ${widget.selectedDigimon.evoName}!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SelectScreen()),
                (route) => false,
              );
            },
            child: const Text('JOGAR NOVAMENTE', style: TextStyle(color: Colors.cyanAccent)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Alterna a imagem e o nome com base na digievolução
    final currentRunImage = isEvolved 
        ? widget.selectedDigimon.evoRunAsset 
        : widget.selectedDigimon.baseRunAsset;

    final currentName = isEvolved 
        ? widget.selectedDigimon.evoName 
        : widget.selectedDigimon.name;

    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Parceiro: $currentName'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Tempo: ${secondsElapsed ~/ 60}:${(secondsElapsed % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Exibição do Digimon e Status na Arena
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isEvolved)
                  const Text(
                    '⚡ DIGIEVOLUÇÃO CONCLUÍDA! ⚡',
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 20),
                Image.asset(
                  currentRunImage,
                  height: 220,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 15),
                Text(
                  'Estágio: ${isEvolved ? "Campeão (${widget.selectedDigimon.evoName})" : "Novato (${widget.selectedDigimon.name})"}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          
          // Controles do Mini-Game na parte inferior
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, padding: const EdgeInsets.all(16)),
                      onPressed: () {
                        // Ação de Pular
                      },
                      child: const Icon(Icons.arrow_upward, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, padding: const EdgeInsets.all(16)),
                      onPressed: () {
                        // Ação de Abaixar
                      },
                      child: const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  onPressed: () {
                    // Ação de Ataque (○)
                  },
                  child: const Text('○ ATAQUE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}