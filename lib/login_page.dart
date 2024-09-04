import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_textfield.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formKey.currentContext != null && _formKey.currentState!.validate()) {
      print(usernameController);
      print(passwordController);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: usernameController.text);

      print("Logged in!");
    } else {
      print("Login Unsuccessful!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Salam! Let's sign you in",
                  style: TextStyle(
                    fontSize: 31,
                    color: Color.fromARGB(255, 15, 105, 63),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your Username",
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Username should exceed 5 characters!";
                        } else if (value != null && value.isEmpty) {
                          return "Please Type your Username";
                        }
                      },
                      controller: usernameController,
                    ),
                    verticalSpacing(10),
                    LoginTextField(
                      controller: passwordController,
                      hintText: "Enter your Password",
                      isPasswordField: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple)),
                    onPressed: () {
                      loginUser(context);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
