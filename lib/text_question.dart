import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:matematika/correct.dart';
import 'package:matematika/list.dart';
import 'package:matematika/wrong.dart';
import 'package:matematika/utilities.dart';

class TextQuestion extends StatefulWidget {
  final String theme;
  final String question;
  final String answer;
  final String regex;
  final String explain;
  final bool isOnlyNumberAnswer;

  const TextQuestion({
    Key? key,
    required this.theme,
    required this.question,
    required this.answer,
    required this.regex,
    required this.explain,
    required this.isOnlyNumberAnswer,
  }) : super(key: key);

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
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SubjectList(),
            )),
          ),
          title: Text(widget.theme,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
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
                  child: TeXViewDocument(widget.question,
                      style: TeXViewStyle(
                        contentColor: Colors.white,
                        fontStyle: TeXViewFontStyle(fontSize: 20),
                        textAlign: TeXViewTextAlign.center,
                      )),
                  renderingEngine: const TeXViewRenderingEngine.katex(),
                ),
              )),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 21, 21, 21),
                          filled: true,
                          labelText: "Įveskite atsakymą",
                          labelStyle: TextStyle(color: Colors.white54),
                        ),
                        keyboardType: widget.isOnlyNumberAnswer ? TextInputType.number : TextInputType.text,
                        controller: myController,
                        onEditingComplete: () {
                          var userAnswer = myController.text;
                          bool correct = regexCheck(widget.regex, userAnswer);

                          if (correct) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnCorrect(
                                          theme: widget.theme,
                                          question: widget.question,
                                          answer: widget.answer,
                                          explain: widget.explain,
                                        )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnWrong(
                                          theme: widget.theme,
                                          question: widget.question,
                                          answer: widget.answer,
                                          wrongAnswer: userAnswer,
                                          explain: widget.explain,
                                        )));
                          }
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
