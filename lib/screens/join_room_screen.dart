import 'package:flutter/material.dart';
import 'package:xox_online/responsive/responsive.dart';
import 'package:xox_online/widgets/custom_btn.dart';
import 'package:xox_online/widgets/custom_text.dart';
import 'package:xox_online/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static const String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  @override
  void dispose() {

    super.dispose();
    _gameNameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(shadows: [
                Shadow(color: Colors.orange[900]!, blurRadius: 50),
              ], text: "Join Room", fontSize: 60),
              SizedBox(height: size.height * 0.1),
              CustomTextField(
                controller: _gameNameController,
                hintText: "Enter Your Nickname",
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _gameIdController,
                hintText: "Enter Game ID",
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton(onPressed: () {}, text: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
