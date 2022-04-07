import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:matematika/test_question.dart';

class Wrong extends StatelessWidget {
  final String theme;
  final String question;
  final String answer;
  final String wrongAnswer;
  final String explain;
  const Wrong({Key? key, required this.theme, required this.question, required this.answer, required this.wrongAnswer, required this.explain}) : super(key: key);

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
                flex: 3,
                child:Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(question, textAlign:TextAlign.justify, style: const TextStyle(color: Colors.white, fontSize: 20.0)),
                      Text(wrongAnswer,style: const TextStyle(color: Colors.red, fontSize: 20.0, decoration: TextDecoration.lineThrough)),
                      Text(answer,style: const TextStyle(color: Colors.green, fontSize: 20.0))
                    ],
                  )
                ),
              ),
              const Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      "Neteisingai",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 50.0),
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Text(
                  explain,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    height: 1
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TestQuestion(theme: theme)));
                  },
                  child: Column(children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
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
            ]
          ),
        ),
      ),
    );
  }
}
