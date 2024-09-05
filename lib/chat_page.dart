import 'dart:convert';

import 'package:chat_app/models/chat_message_entities.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initial state of messages:
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<ChatMessageEntity> _chatMessages = decodedList.map((listIem) {
      return ChatMessageEntity.fromJson(listIem);
    }).toList();

    print(_chatMessages.length);

    //final state of messages:
    setState(() {
      _messages = _chatMessages;
    });
  }

  @override
  void initState() {
    _loadInitialMessages();
  }

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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                    alignment: _messages[index].author.userName == "Khan1"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    entity: _messages[index]);
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    )));
  }
}
