import 'package:flutter/material.dart';
import 'package:matematika/list.dart';
import 'package:matematika/utilities.dart';

class TestEnd extends StatelessWidget {
  final String theme;
  final int correct;
  final double total;

  const TestEnd(
      {Key? key,
      required this.theme,
      required this.correct,
      required this.total})
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
                child: Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: total,
                  backgroundColor: const Color.fromARGB(255, 21, 21, 21),
                  color: Colors.green,
                  minHeight: 5,
                ),
                Expanded(
                    flex: 5,
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Testo rezultatai:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 50),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: correct.toString(),
                                        style: const TextStyle(
                                            color: Colors.green)),
                                    const TextSpan(
                                        text: " / ",
                                        style: TextStyle(color: Colors.yellow)),
                                    TextSpan(
                                        text: total.toInt().toString(),
                                        style:
                                            const TextStyle(color: Colors.red))
                                  ]))
                            ]))),
                Expanded(
                    flex: 5,
                    child: Align(
                        alignment: Alignment.center,
                        child: InkWell(
                            onTap: () {
                              resetCounts();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TestList()));
                            },
                            child: SizedBox(
                                width: 100.0,
                                height: 50.0,
                                child: Card(
                                  color: const Color.fromARGB(255, 21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text("Atgal",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ))
                                      ]),
                                )))))
              ],
            ))));
  }
}
