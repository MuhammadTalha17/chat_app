import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_app.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';

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
              primary: BrandColor.primaryColor),
          useMaterial3: true,
        ),
        title: "Chat App",
        home: LoginPage(),
        routes: {
          '/chat': (context) => ChatPage(),
        });
  }
}
