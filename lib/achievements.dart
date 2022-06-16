import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matematika/main.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MainMenu())),
          ),
          title: const Text("Pasiekimai", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(children: [
          const Divider(color: Color.fromARGB(255, 21, 21, 21), thickness: 2)
          ]
        )
      )
    );
  }
}