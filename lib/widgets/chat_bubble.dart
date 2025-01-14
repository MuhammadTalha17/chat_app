import 'package:chat_app/models/chat_message_entities.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({super.key, required this.entity, required this.alignment});

  @override
  Widget build(BuildContext context) {
    bool isAuthor =
        entity.author.userName == context.read<AuthService>().getUserName();

    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isAuthor ? Theme.of(context).primaryColor : Colors.black87,
            borderRadius: const BorderRadius.only(
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
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(entity.imageUrl!)),
                    borderRadius: BorderRadius.circular(11)),
              )
          ],
        ),
      ),
    );
    ;
  }
}
