import 'package:flutter/material.dart';
import 'package:xox_online/screens/create_room_screen.dart';
import 'package:xox_online/screens/game_screen.dart';
import 'package:xox_online/screens/join_room_screen.dart';
import 'package:xox_online/screens/main_menu_screen.dart';
import 'package:xox_online/utils/colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
