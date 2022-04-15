import 'package:flutter/material.dart';
import 'package:matematika/correct.dart';
import 'package:matematika/list.dart';
import 'package:matematika/wrong.dart';
import 'package:flutter_tex/flutter_tex.dart';

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
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SubjectList())),
          ),
          title: Text(theme, style: const TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
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
                              builder: (context) => Correct(
                                    theme: theme,
                                    question: question,
                                    answer: answers[int.parse(index)],
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
                                    wrongAnswer: answers[int.parse(index)],
                                    explain: explain,
                                  )));
                    }
                  })
            ]),
            renderingEngine: const TeXViewRenderingEngine.katex(),
          ),
        ),
      ),
    );
  }
}
