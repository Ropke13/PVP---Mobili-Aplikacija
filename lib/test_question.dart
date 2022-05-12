//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:matematika/correct.dart';
import 'package:matematika/list.dart';
import 'package:matematika/wrong.dart';
import 'package:flutter_tex/flutter_tex.dart';

var colors = [Colors.green, Colors.blue, Colors.yellow, Colors.red];

class LearnQuestion extends StatelessWidget {
  final String theme;
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final String explain;
  const LearnQuestion({Key? key, required this.theme, required this.question, required this.answers, required this.correctAnswer, required this.explain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SubjectList())),
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
                child: TeXView(
                  child: TeXViewColumn(children: <TeXViewWidget>[
                    TeXViewDocument(question,
                        style: TeXViewStyle(
                          contentColor: Colors.white,
                          fontStyle: TeXViewFontStyle(fontSize: 20),
                          textAlign: TeXViewTextAlign.center,
                          padding: const TeXViewPadding.only(sizeUnit: TeXViewSizeUnit.pt, bottom: 20),
                        )),
                    TeXViewGroup(
                        children: answers.map((String answer) {
                          return TeXViewGroupItem(
                              id: answers.indexOf(answer).toString(),
                              child: TeXViewDocument(String.fromCharCode(answers.indexOf(answer) + 65) + ": " + answer,
                                  style: TeXViewStyle(
                                    contentColor: Colors.white,
                                    fontStyle: TeXViewFontStyle(fontSize: 20),
                                    textAlign: TeXViewTextAlign.left,
                                    padding: const TeXViewPadding.all(10, sizeUnit: TeXViewSizeUnit.pt),
                                    margin: const TeXViewMargin.all(5, sizeUnit: TeXViewSizeUnit.pt),
                                    borderRadius: const TeXViewBorderRadius.all(7, sizeUnit: TeXViewSizeUnit.pt),
                                    backgroundColor: Colors.grey.shade900,
                                  )));
                        }).toList(),
                        onTap: (String index) {
                          if (index == correctAnswer.toString()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnCorrect(
                                          theme: theme,
                                          question: question,
                                          answer: answers[int.parse(index)],
                                          explain: explain,
                                        )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnWrong(
                                          theme: theme,
                                          question: question,
                                          answer: answers[correctAnswer],
                                          wrongAnswer: answers[int.parse(index)],
                                          explain: explain,
                                        )));
                          }
                        })
                  ]),
                  renderingEngine: const TeXViewRenderingEngine.katex(),
                ),
              )
              )
          ]
        )
        ),
      ),
    );
  }
}

class TestQuestion extends StatelessWidget {
  final String theme;
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final double count;
  final String explain;
  const TestQuestion({Key? key, required this.theme, required this.question, required this.answers, required this.correctAnswer, required this.count, required this.explain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35),
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SubjectList())),
          ),
          title: Text(theme, style: const TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(value: count, backgroundColor: const Color.fromARGB(255, 21, 21, 21), color: Colors.green, minHeight: 5),
              Expanded(
              child: Align(
                alignment: Alignment.center,
                child: TeXView(
                  child: TeXViewColumn(children: <TeXViewWidget>[
                    TeXViewDocument(question,
                        style: TeXViewStyle(
                          contentColor: Colors.white,
                          fontStyle: TeXViewFontStyle(fontSize: 20),
                          textAlign: TeXViewTextAlign.center,
                          padding: const TeXViewPadding.only(sizeUnit: TeXViewSizeUnit.pt, bottom: 20),
                        )),
                    TeXViewGroup(
                        children: answers.map((String answer) {
                          return TeXViewGroupItem(
                              id: answers.indexOf(answer).toString(),
                              child: TeXViewDocument(String.fromCharCode(answers.indexOf(answer) + 65) + ": " + answer,
                                  style: TeXViewStyle(
                                    contentColor: Colors.white,
                                    fontStyle: TeXViewFontStyle(fontSize: 20),
                                    textAlign: TeXViewTextAlign.left,
                                    padding: const TeXViewPadding.all(10, sizeUnit: TeXViewSizeUnit.pt),
                                    margin: const TeXViewMargin.all(5, sizeUnit: TeXViewSizeUnit.pt),
                                    borderRadius: const TeXViewBorderRadius.all(7, sizeUnit: TeXViewSizeUnit.pt),
                                    backgroundColor: Colors.grey.shade900,
                                  )));
                        }).toList(),
                        onTap: (String index) {
                          if (index == correctAnswer.toString()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestCorrect(
                                          theme: theme,
                                          question: question,
                                          answer: answers[int.parse(index)],
                                          count: count + 0.1,
                                          explain: explain,
                                        )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestWrong(
                                          theme: theme,
                                          question: question,
                                          answer: answers[correctAnswer],
                                          count: count + 0.1,
                                          wrongAnswer: answers[int.parse(index)],
                                          explain: explain,
                                        )));
                          }
                        })
                  ]),
                  renderingEngine: const TeXViewRenderingEngine.katex(),
                ),
              )
              )
          ]
        )
        ),
      ),
    );
  }
}
