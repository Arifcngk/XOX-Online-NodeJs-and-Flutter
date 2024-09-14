import 'package:flutter/material.dart';
import 'package:xox_online/responsive/responsive.dart';
import 'package:xox_online/screens/create_room_screen.dart';
import 'package:xox_online/screens/join_room_screen.dart';
import 'package:xox_online/widgets/custom_btn.dart';

class MainMenuScreen extends StatelessWidget {
  static const String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.of(context).pushNamed(CreateRoomScreen.routeName);
    print("Logged in Create Room");
  }

  void joinRoom(BuildContext context) {
    Navigator.of(context).pushNamed(JoinRoomScreen.routeName);
    print("Logged in Join Room");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onPressed: () => createRoom(context), text: "Create Room"),
            const SizedBox(height: 20),
            CustomButton(onPressed: () => joinRoom(context), text: "Join Room"),
          ],
        ),
      ),
    );
  }
}
