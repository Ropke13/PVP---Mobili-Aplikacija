import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matematika/main.dart';
import 'package:matematika/test_question.dart';
import 'package:matematika/text_question.dart';
import 'package:matematika/utilities.dart';

// Tures but duomenu bazej
var themeList = ['Skaičiai ir skaičiavimai', 'Lygtys ir lygčių sistemos'];
var iconList = ['1', '='];
var colorList = [Colors.green, Colors.green];
var completed = [Icons.check, Icons.cancel_outlined];
var completedColors = [Colors.green, Colors.red];

class TestList extends StatelessWidget {
  const TestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainMenu())),
          ),
          title: const Text("Testai", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                        tileColor: const Color.fromARGB(255, 21, 21, 21),
                        textColor: Colors.white,
                        leading: CircleAvatar(
                          child: Text(iconList[index], style: TextStyle(color: colorList[index], fontSize: 30)),
                          backgroundColor: Colors.black,
                        ),
                        title: Text(themeList[index], style: const TextStyle(fontSize: 20)),
                        trailing: Icon(completed[index], size: 30, color: completedColors[index]),
                        onTap: () async {
                          final question = await generateQuestion(themeList[index]);
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
                                          isOnlyNumberAnswer: question?['is_numbers_only'],
                                          explain: question?['explain'],
                                        )));
                          } else {
                            List<String> answersList = List<String>.from(question?['answers']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnQuestion(
                                          theme: themeList[index],
                                          question: question?['uzdavinys'],
                                          answers: answersList,
                                          correctAnswer: question?['correct_answer'],
                                          explain: question?['explain'],
                                        )));
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
  const SubjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainMenu())),
          ),
          title: const Text("Temos", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                        tileColor: const Color.fromARGB(255, 21, 21, 21),
                        textColor: Colors.white,
                        leading: CircleAvatar(
                          child: Text(iconList[index], style: const TextStyle(color: Colors.white38, fontSize: 30)),
                          backgroundColor: Colors.black,
                        ),
                        title: Text(themeList[index], style: const TextStyle(fontSize: 20)),
                        onTap: () async {
                          final question = await generateQuestion(themeList[index]);
                          bool checker = question?['is_text'];
                          print(themeList[index]);
                          print(question?['uzdavinys']);
                          print(question?['correct_answer']);
                          print(question?['explain']);
                          if (checker) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TextQuestion(
                                          theme: themeList[index],
                                          question: question?['uzdavinys'],
                                          answer: question?['correct_answer'],
                                          regex: question?['regex'],
                                          isOnlyNumberAnswer: question?['is_numbers_only'],
                                          explain: question?['explain'],
                                        )));
                          } else {
                            List<String> answersList = List<String>.from(question?['answers']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnQuestion(
                                          theme: themeList[index],
                                          question: question?['uzdavinys'],
                                          answers: answersList,
                                          correctAnswer: question?['correct_answer'],
                                          explain: question?['explain'],
                                        )));
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
