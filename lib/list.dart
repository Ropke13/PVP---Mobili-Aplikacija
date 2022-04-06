import 'package:flutter/material.dart';
import 'package:matematika/test_question.dart';
import 'package:matematika/text_question.dart';
import 'package:matematika/utilities.dart';

var themeList = ['Skaičiai ir skaičiavimai', 'Laipsniai ir šaknys', 'Lygtys ir lygčių sistemos'];
var iconList = ['🔢', '^', '='];

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
            onPressed: () => Navigator.of(context).pop(),
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
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TestQuestion(theme: themeList[index])));
                          } else {
                            List<String> question = generateNewQuestion();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TextQuestion(
                                          theme: themeList[index],
                                          question: question[0],
                                          answer: question[1],
                                          explain: question[2],
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
