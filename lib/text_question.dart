import 'package:flutter/material.dart';
import 'package:matematika/correct.dart';
import 'package:matematika/wrong.dart';
import 'dart:math';

int digit1 = 0;
int digit2 = 0;
String answer = "";

String question = generateNewQuestion();

String generateNewQuestion() {
  digit1 = 1 + Random().nextInt(10 - 1); // [1; 10)
  digit2 = 1 + Random().nextInt(4 - 1); // [1; 4)
  answer = (digit1 * digit2).toString();

  return "Kiek yra " + digit1.toString() + "*" + digit2.toString() + "?";
}

class TextQuestion extends StatefulWidget {
  const TextQuestion({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TextQuestionState();
  }
}

class TextQuestionState extends State<TextQuestion> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
              TextField(
                keyboardType: TextInputType.number,
                controller: myController,
                onEditingComplete: () {
                  var userAnswer = myController.text;
                  bool correct = userAnswer == answer;

                  question = generateNewQuestion();

                  if (correct) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Correct()));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Wrong()));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
