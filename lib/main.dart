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
      title: "Chat App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            primary: Colors.blue.shade50, seedColor: Colors.blue.shade400),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
