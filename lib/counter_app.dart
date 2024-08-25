import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            num++;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          "Counter: $num",
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
