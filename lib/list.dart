 import 'package:flutter/material.dart';

 var list = ['Procentai', 'Laipsniai ir šaknys', 'Lygtys ir lygčių sistemos'];

 class SubjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(list[index]),
                      ),
                      Divider(),
                    ],
                  );
                }),
          )
        ]),
      ),
    );
  }
}
