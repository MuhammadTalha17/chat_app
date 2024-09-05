import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthService(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 88, 2, 2),
              primary: BrandColor.primaryColor),
          useMaterial3: true,
        ),
        title: "Chat App",
        home: FutureBuilder<bool>(
          future: context.read<AuthService>().isLoggedIn(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            return CircularProgressIndicator();
          },
        ),
        routes: {
          '/chat': (context) => ChatPage(),
        });
  }
}
