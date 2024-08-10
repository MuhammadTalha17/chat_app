import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
          body: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 207, 195, 57),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome to Chat App!",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Image.network(
                      "https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg",
                      height: 250,
                      width: 185,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 207, 195, 57),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome to Chat App!",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Image.network(
                      "https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg",
                      height: 250,
                      width: 185,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(50),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 207, 195, 57),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Welcome to Chat App!",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Image.network(
                      "https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg",
                      height: 250,
                      width: 185,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 39, 38, 38),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
