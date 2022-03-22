import 'package:flutter/material.dart';
import 'package:matematika/correct.dart';
import 'package:matematika/wrong.dart';

var question = "Kiek 12 klasės mokinių yra Lietuvoje?";
var answers = ["10", "5000", "25000", "100000"];
var correctAnswer = 2;

class TestQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(question),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: answers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(answers[index]),
                              onTap: () {
                                if (index == correctAnswer) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Correct()));
                                } else {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Wrong()));
                                }
                              },
                            ),
                            Divider(),
                          ],
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
