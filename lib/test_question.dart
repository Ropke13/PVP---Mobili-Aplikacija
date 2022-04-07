import 'package:flutter/material.dart';
import 'package:matematika/correct.dart';
import 'package:matematika/wrong.dart';

var colors = [Colors.green, Colors.blue, Colors.yellow, Colors.red];

class TestQuestion extends StatelessWidget {
  final String theme;
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final String explain;
  const TestQuestion({Key? key, required this.theme, required this.question, required this.answers, required this.correctAnswer, required this.explain}) : super(key: key);

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
          title: Text(theme, style: const TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
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
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(question, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 20.0)),
              ))),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          itemCount: answers.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                                  tileColor: const Color.fromARGB(255, 21, 21, 21),
                                  textColor: Colors.white,
                                  leading: CircleAvatar(
                                    child: Text(String.fromCharCode(index + 65), style: TextStyle(color: colors[index], fontSize: 30)),
                                    backgroundColor: Colors.black,
                                  ),
                                  title: Text(answers[index], style: const TextStyle(color: Colors.white, fontSize: 20)),
                                  onTap: () {
                                    if (index == correctAnswer) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Correct(
                                                    theme: theme,
                                                    question: question,
                                                    answer: answers[index],
                                                    explain: explain,
                                                  )));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Wrong(
                                                    theme: theme,
                                                    question: question,
                                                    answer: answers[correctAnswer],
                                                    wrongAnswer: answers[index],
                                                    explain: explain,
                                                  )));
                                    }
                                  },
                                ),
                                const Divider()
                              ],
                            );
                          })))
            ],
          ),
        ),
      ),
    );
  }
}
