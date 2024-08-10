import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Column(
        children: [
          const Text(
            "Salam! Let's sign you in",
            style: TextStyle(
              fontSize: 31,
              color: Color.fromARGB(255, 15, 105, 63),
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            "Welcome to Chat App!",
            style: TextStyle(
                fontSize: 31,
                color: Colors.amber.shade600,
                fontWeight: FontWeight.bold),
          ),
          Image.network(
            "https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg",
            height: 250,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue.shade50,
            ),
          )
        ],
      ),
    );
  }
}
