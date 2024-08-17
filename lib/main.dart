import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_app.dart';
import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 88, 2, 2),
          primary: Color.fromARGB(255, 65, 2, 102),
        ),
        useMaterial3: true,
      ),
      title: "Chat App",
      home: LoginPage(),
    );
  }
}
