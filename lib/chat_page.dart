import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 95, 139),
        title: const Text("Salam!"),
        actions: [
          IconButton(
            onPressed: () {
              print("Tapped!");
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return ChatBubble(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    message: "Salam!");
              },
            ),
          ),
          const ChatInput(),
        ],
      ),
    )));
  }
}
