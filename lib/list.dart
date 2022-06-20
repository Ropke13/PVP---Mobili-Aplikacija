import 'package:flutter/material.dart';
import 'package:matematika/main.dart';
import 'package:matematika/test_question.dart';
import 'package:matematika/text_question.dart';
import 'package:matematika/utilities.dart';

// Tures but duomenu bazej
var themeList = [
  'Skaičiai ir skaičiavimai',
  'Lygtys ir jų sistemos',
  'Logaritminės funkcijos',
  'Rodiklinės funkcijos',
  'Žodiniai uždaviniai',
  'Skaičių sekos. Aritmetinė progresija'
];
var iconList = ['1', '=', 'lg', '^', 'Ž', '9'];
var colorList = [
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green
];
var completed = [
  Icons.check,
  Icons.cancel_outlined,
  Icons.check,
  Icons.check,
  Icons.check,
  Icons.check
];
var completedColors = [
  Colors.green,
  Colors.red,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green
];

class TestList extends StatelessWidget {
  final bool rodyti;

  const TestList({Key? key, required this.rodyti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    resetCounts();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainMenu())),
          ),
          title: const Text("Testai",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(children: [
          const Divider(color: Color.fromARGB(255, 21, 21, 21), thickness: 2),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: themeList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        tileColor: const Color.fromARGB(255, 21, 21, 21),
                        textColor: Colors.white,
                        leading: CircleAvatar(
                          child: Text(iconList[index],
                              style: TextStyle(
                                  color: colorList[index], fontSize: 30)),
                          backgroundColor: Colors.black,
                        ),
                        title: Text(themeList[index],
                            style: const TextStyle(fontSize: 20)),
                        trailing: Icon(completed[index],
                            size: 30, color: completedColors[index]),
                        onTap: () async {
                          final question =
                              await generateQuestion(themeList[index]);
                          bool checker = question?['is_text'];
                          if (checker) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TextQuestionTest(
                                        count: 0,
                                        theme: themeList[index],
                                        question: question?['uzdavinys'],
                                        answer: question?['correct_answer'],
                                        regex: question?['regex'],
                                        isOnlyNumberAnswer:
                                            question?['is_numbers_only'],
                                        explain: question?['explain'],
                                        rodyti: false)));
                          } else {
                            List<String> answersList =
                                List<String>.from(question?['answers']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestQuestion(
                                        count: 0,
                                        theme: themeList[index],
                                        question: question?['uzdavinys'],
                                        answers: answersList,
                                        correctAnswer:
                                            question?['correct_answer'],
                                        explain: question?['explain'],
                                        rodyti: false)));
                          }
                        },
                      ),
                      const Divider(color: Colors.black, thickness: 2),
                    ],
                  );
                }),
          )
        ]),
      ),
    );
  }
}

class SubjectList extends StatelessWidget {
  final bool rodyti;

  const SubjectList({Key? key, required this.rodyti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainMenu())),
          ),
          title: const Text("Temos",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(children: [
          const Divider(color: Color.fromARGB(255, 21, 21, 21), thickness: 2),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: themeList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        tileColor: const Color.fromARGB(255, 21, 21, 21),
                        textColor: Colors.white,
                        leading: CircleAvatar(
                          child: Text(iconList[index],
                              style: const TextStyle(
                                  color: Colors.white38, fontSize: 30)),
                          backgroundColor: Colors.black,
                        ),
                        title: Text(themeList[index],
                            style: const TextStyle(fontSize: 20)),
                        onTap: () async {
                          final question =
                              await generateQuestion(themeList[index]);
                          bool checker = question?['is_text'];
                          if (checker) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TextQuestion(
                                        theme: themeList[index],
                                        question: question?['uzdavinys'],
                                        answer: question?['correct_answer'],
                                        regex: question?['regex'],
                                        isOnlyNumberAnswer:
                                            question?['is_numbers_only'],
                                        explain: question?['explain'],
                                        rodyti: rodyti)));
                          } else {
                            List<String> answersList =
                                List<String>.from(question?['answers']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnQuestion(
                                        theme: themeList[index],
                                        question: question?['uzdavinys'],
                                        answers: answersList,
                                        correctAnswer:
                                            question?['correct_answer'],
                                        explain: question?['explain'],
                                        rodyti: rodyti)));
                          }
                        },
                      ),
                      const Divider(color: Colors.black, thickness: 2),
                    ],
                  );
                }),
          )
        ]),
      ),
    );
  }
}
