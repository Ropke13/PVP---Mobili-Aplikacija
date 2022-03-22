import 'package:flutter/material.dart';
import 'package:matematika/test_question.dart';
import 'package:matematika/text_question.dart';

var list = ['Procentai', 'Laipsniai ir šaknys', 'Lygtys ir lygčių sistemos'];

class SubjectList extends StatelessWidget {
  const SubjectList({Key? key}) : super(key: key);

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
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TestQuestion()));
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TextQuestion()));
                          }
                        },
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
