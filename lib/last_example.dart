import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LastExample extends StatefulWidget {
  const LastExample({super.key});

  @override
  State<LastExample> createState() => _LastExampleState();
}

class _LastExampleState extends State<LastExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Example'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}