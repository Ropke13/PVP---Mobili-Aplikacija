import 'package:flutter/material.dart';

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: const Text("Neteisingai"),
        ),
      ),
    );
  }
}
