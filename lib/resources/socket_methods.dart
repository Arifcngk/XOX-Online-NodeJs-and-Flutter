import 'package:flutter/material.dart';
import 'package:xox_online/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit(
          'createRoom', nickname); // sadece nickname olarak gönder
    } else {
      print('Nickname is empty');
    }
  }
void createRoomSuccessListener(BuildContext context) {
 _socketClient.on('createRoomSuccess', (room) {
      print('createRoomSuccess');
      print(room);
      Navigator.pushNamed(context, '/game', arguments: room);
    });
  }



}





