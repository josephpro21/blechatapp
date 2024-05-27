import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BLE MEET'),
        ),
        body: const Center(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
