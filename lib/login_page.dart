import 'package:chat_app/chat_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/login_textfield.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> loginUser(context) async {
    if (_formKey.currentContext != null && _formKey.currentState!.validate()) {
      print(usernameController);
      print(passwordController);

      await context.read<AuthService>().loginUser(usernameController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: usernameController.text);

      print("Logged in!");
    } else {
      print("Login Unsuccessful!");
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
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
              verticalSpacing(23),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/illustration.png')),
                    borderRadius: BorderRadius.circular(21)),
              ),
              verticalSpacing(23),
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
                padding: const EdgeInsets.only(top: 5.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple)),
                    onPressed: () async {
                      await loginUser(context);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  print("Link Clicked!");
                  await _launchURL("https://www.google.com");
                },
                child: const Center(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              //Fix this. It's not working
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.twitter(
                    color: Colors.blue,
                    url: "https://twitter.com",
                  ),
                  SocialMediaButton.github(
                      color: Colors.black54, url: "https://github.com"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
