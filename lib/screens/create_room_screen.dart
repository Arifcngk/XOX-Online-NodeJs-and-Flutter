import 'package:flutter/material.dart';
import 'package:xox_online/resources/socket_methods.dart';
import 'package:xox_online/responsive/responsive.dart';
import 'package:xox_online/widgets/custom_btn.dart';
import 'package:xox_online/widgets/custom_text.dart';
import 'package:xox_online/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static const String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _roomNameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    _roomNameController.dispose();
    super.dispose();
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
              ], text: "Create Room", fontSize: 60),
              SizedBox(height: size.height * 0.1),
              CustomTextField(
                controller: _roomNameController,
                hintText: "Create Name",
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton(
                  onPressed: () =>
                      _socketMethods.createRoom(_roomNameController.text),
                  text: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
