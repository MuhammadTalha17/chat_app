import 'package:chat_app/models/chat_message_entities.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({super.key, required this.entity, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 146, 177, 63),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (entity.imageUrl != null)
              Image.network(
                '${entity.imageUrl}',
                height: 200,
              )
          ],
        ),
      ),
    );
    ;
  }
}
