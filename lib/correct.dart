import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:matematika/main.dart';
import 'package:matematika/test_question.dart';
import 'package:matematika/text_question.dart';
import 'package:matematika/utilities.dart';
import 'package:matematika/testEnd.dart';

class LearnCorrect extends StatelessWidget {
  final String theme;
  final String question;
  final String answer;
  final String explain;
  final bool rodyti;
  
  const LearnCorrect(
      {Key? key,
      required this.theme,
      required this.question,
      required this.answer,
      required this.explain,
      required this.rodyti})
      : super(key: key);

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
          title: Text(theme,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            const Divider(color: Color.fromARGB(255, 21, 21, 21), thickness: 2),
            Expanded(
                flex: 5,
                child: Align(
                    alignment: Alignment.center,
                    child: TeXView(
                        child: TeXViewColumn(
                          children: <TeXViewWidget>[
                            TeXViewContainer(
                                child: TeXViewColumn(children: <TeXViewWidget>[
                                  TeXViewDocument(question,
                                      style: TeXViewStyle(
                                        contentColor: Colors.white,
                                        fontStyle:
                                            TeXViewFontStyle(fontSize: 20),
                                        textAlign: TeXViewTextAlign.center,
                                        padding: const TeXViewPadding.only(
                                          sizeUnit: TeXViewSizeUnit.pt,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                      )),
                                  TeXViewDocument(answer,
                                      style: TeXViewStyle(
                                        contentColor: Colors.green,
                                        fontStyle:
                                            TeXViewFontStyle(fontSize: 20),
                                        textAlign: TeXViewTextAlign.center,
                                      )),
                                ]),
                                style: const TeXViewStyle(
                                  padding: TeXViewPadding.only(
                                    sizeUnit: TeXViewSizeUnit.pt,
                                    left: 30,
                                    right: 30,
                                  ),
                                )),
                            TeXViewDocument("Teisingai!",
                                style: TeXViewStyle(
                                  contentColor: Colors.green,
                                  fontStyle: TeXViewFontStyle(
                                      fontSize: 50,
                                      fontWeight: TeXViewFontWeight.bold),
                                  textAlign: TeXViewTextAlign.center,
                                )),
                            if (rodyti == true) ...[
                              TeXViewDocument(explain,
                                  style: TeXViewStyle(
                                    contentColor: Colors.white,
                                    fontStyle: TeXViewFontStyle(fontSize: 15),
                                    textAlign: TeXViewTextAlign.center,
                                    padding: const TeXViewPadding.only(
                                      sizeUnit: TeXViewSizeUnit.pt,
                                      left: 30,
                                      right: 30,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                  )),
                            ]
                          ],
                        ),
                        renderingEngine:
                            const TeXViewRenderingEngine.katex()))),
            Expanded(
              child: InkWell(
                  onTap: () async {
                    final question = await generateQuestion(theme);
                    bool checker = question?['is_text'];
                    if (checker) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TextQuestion(
                                  theme: theme,
                                  question: question?['uzdavinys'],
                                  answer: question?['correct_answer'],
                                  regex: question?['regex'],
                                  isOnlyNumberAnswer:
                                      question?['is_numbers_only'],
                                  explain: question?['explain'])));
                    } else {
                      List<String> answersList =
                          List<String>.from(question?['answers']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearnQuestion(
                                  theme: theme,
                                  question: question?['uzdavinys'],
                                  answers: answersList,
                                  correctAnswer: question?['correct_answer'],
                                  explain: question?['explain'])));
                    }
                  },
                  child: Column(children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text("Toliau",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ))
                            ]),
                      ),
                    )
                  ])),
            )
          ]),
        ),
      ),
    );
  }
}

class TestCorrect extends StatelessWidget {
  final String theme;
  final String question;
  final String answer;
  final String explain;
  final double count;

  const TestCorrect(
      {Key? key,
      required this.count,
      required this.theme,
      required this.question,
      required this.answer,
      required this.explain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(theme,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            LinearProgressIndicator(
            value: count,
            backgroundColor: const Color.fromARGB(255, 21, 21, 21),
            color: Colors.green,
            minHeight: 5,
          ),
            Expanded(
                flex: 5,
                child: Align(
                    alignment: Alignment.center,
                    child: TeXView(
                        child: TeXViewColumn(
                          children: <TeXViewWidget>[
                            TeXViewContainer(
                                child: TeXViewColumn(children: <TeXViewWidget>[
                                  TeXViewDocument(question,
                                      style: TeXViewStyle(
                                        contentColor: Colors.white,
                                        fontStyle:
                                            TeXViewFontStyle(fontSize: 20),
                                        textAlign: TeXViewTextAlign.center,
                                        padding: const TeXViewPadding.only(
                                          sizeUnit: TeXViewSizeUnit.pt,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                      )),
                                  TeXViewDocument(answer,
                                      style: TeXViewStyle(
                                        contentColor: Colors.yellow,
                                        fontStyle:
                                            TeXViewFontStyle(fontSize: 20),
                                        textAlign: TeXViewTextAlign.center,
                                      )),
                                ]),
                                style: const TeXViewStyle(
                                  padding: TeXViewPadding.only(
                                    sizeUnit: TeXViewSizeUnit.pt,
                                    left: 30,
                                    right: 30,
                                  ),
                                )),
                          ],
                        ),
                        renderingEngine:
                            const TeXViewRenderingEngine.katex()))),
            Expanded(
              child: InkWell(
                  onTap: () async {
                    final question = await generateQuestion(theme);
                    bool checker = question?['is_text'];
                    if (checker) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TextQuestionTest(
                                  count: count + 0.34,
                                  theme: theme,
                                  question: question?['uzdavinys'],
                                  answer: question?['correct_answer'],
                                  regex: question?['regex'],
                                  isOnlyNumberAnswer:
                                      question?['is_numbers_only'],
                                  explain: question?['explain'])));
                    } else {
                      List<String> answersList =
                          List<String>.from(question?['answers']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestQuestion(
                                  count: count + 0.34,
                                  theme: theme,
                                  question: question?['uzdavinys'],
                                  answers: answersList,
                                  correctAnswer: question?['correct_answer'],
                                  explain: question?['explain'])));
                    }
                    countQ();
                    addCorrect();
                    if (getCountQuestions() >= 3) {
                      int correct = getCorrect();
                      double total = getCountQuestions().toDouble();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestEnd(theme: theme, correct: correct, total: total)));
                    }
                  },
                  child: Column(children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text("Toliau",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ))
                            ]),
                      ),
                    )
                  ])),
            )
          ]),
        ),
      ),
    );
  }
}
