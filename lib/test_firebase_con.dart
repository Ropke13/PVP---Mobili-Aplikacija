import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class test_firebase_con extends StatefulWidget {
  const test_firebase_con({Key? key}) : super(key: key);

  @override
  _test_firebase_con createState() => _test_firebase_con();
}

// ignore: camel_case_types
class _test_firebase_con extends State<test_firebase_con> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const TextField(),
        ),
        body: Center(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('items').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  children: snapshot.data!.docs.map((item) {
                    return Center(
                      child: ListTile(
                        title: Text(item['name']),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {},
        ),
      ),
    );
  }
}
