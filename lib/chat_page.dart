import 'package:chat_app/models/chat_message_entities.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 95, 139),
        foregroundColor: Colors.white,
        title: Text("Salam! $userName"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
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
                    entity: ChatMessageEntity(
                      id: "1",
                      author: Author(userName: "Khan17"),
                      text: "Salam!",
                      createdAt: DateTime.now().millisecondsSinceEpoch,
                      imageUrl:
                          'https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg',
                    ));
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    )));
  }
}
