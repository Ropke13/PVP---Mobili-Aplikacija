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

String explain = "Sudauginus $digit1 su $digit2 gauname $answer";

class TextQuestion extends StatefulWidget {
  final String theme;
  const TextQuestion({Key? key, required this.theme}) : super(key: key);

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
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.theme, style: const TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ), 
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const Divider(color: Color.fromARGB(255, 21, 21, 21), thickness: 2),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(question, textAlign:TextAlign.justify, style: const TextStyle(color: Colors.white, fontSize: 20.0))
                )
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(fillColor: Color.fromARGB(255, 21, 21, 21), filled: true, labelText: "Įveskite atsakymą", labelStyle: TextStyle(color: Colors.white54)),
                    keyboardType: TextInputType.number,
                    controller: myController,
                    onEditingComplete: () {
                      var userAnswer = myController.text;
                      bool correct = userAnswer == answer;

                      if (correct) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Correct(theme: widget.theme, question: question, answer:answer, explain:explain)));
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Wrong(theme: widget.theme, question: question, answer:answer, wrongAnswer:userAnswer, explain:explain)));
                      }
                    },
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
