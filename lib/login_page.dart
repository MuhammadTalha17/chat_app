import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              "Welcome to Chat App!\n Chat with your friends",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 31,
                  color: Colors.amber.shade600,
                  fontWeight: FontWeight.bold),
            ),
            Image.network(
              "https://static.vecteezy.com/system/resources/previews/014/664/394/non_2x/chat-bot-symbol-and-logo-icon-vector.jpg",
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
