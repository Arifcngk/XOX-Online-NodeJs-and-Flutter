import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Game Screen'),
      ),
    );
  }
}
