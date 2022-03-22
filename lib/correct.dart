import 'package:flutter/material.dart';

class Correct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: const Text("Teisingai"),
        ),
      ),
    );
  }
}
