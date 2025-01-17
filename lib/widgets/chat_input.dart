import 'package:chat_app/models/chat_message_entities.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;
  const ChatInput({super.key, required this.onSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() async {
    String? userNameFromCache = await context.read<AuthService>().getUserName();
    print("Chat Message: ${chatMessageController.text}");

    final newChatMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: "124",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: userNameFromCache!));

    if (_selectedImageUrl.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);
    chatMessageController.clear();
    _selectedImageUrl = '';
    setState(() {});
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NetworkImagePickerBody(
                    onImageSelected: onImagePicked,
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 3,
                  controller: chatMessageController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type a message...",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                if (_selectedImageUrl.isNotEmpty)
                  Image.network(
                    _selectedImageUrl,
                    height: 50,
                  )
              ],
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
