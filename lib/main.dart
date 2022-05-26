import 'package:matematika/test_firebase_con.dart';
import 'package:flutter/material.dart';
import 'package:matematika/list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matematika/Login_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyBYFz8vYl44GlU8z0jAIGOD8RNz_irh7tI",
      appId: "1:56331451248:web:73ef6aaedb3f529e4c2db5",
      messagingSenderId: "56331451248",
      projectId: "matematika-21de2",
    ),
    name: "DevApp",
  );
  runApp(const MaterialApp(home: MainMenu()));
}

class MainMenu extends StatelessWidget {
  // Icons
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData award = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cog = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pencilSquared = IconData(0xf14b, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  const MainMenu({Key? key}) : super(key: key);

  // Menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 60.0))
              ],
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Sveikas atvykęs į MathPro",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          )),
          const Center(
            child: Text(
              "Kur keliausi toliau?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0, height: 3),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectList()));
                        },
                        child: Column(children: <Widget>[
                          SizedBox(
                            width: 130.0,
                            height: 130.0,
                            child: Card(
                              color: const Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                                Icon(Icons.calculate_rounded, color: Colors.green, size: 72.5),
                                Text("Mokytis",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      height: 1.2,
                                    ))
                              ]),
                            ),
                          )
                        ]))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TestList()));
                        },
                        child: Column(children: <Widget>[
                          SizedBox(
                            width: 130.0,
                            height: 130.0,
                            child: Card(
                              color: const Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                                Icon(pencilSquared, color: Colors.blue, size: 66),
                                Text("Testai",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      height: 1.45,
                                    ))
                              ]),
                            ),
                          )
                        ]))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectList()));
                        },
                        child: Column(children: <Widget>[
                          SizedBox(
                            width: 130.0,
                            height: 130.0,
                            child: Card(
                              color: const Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                                Icon(award, color: Colors.yellow, size: 63.5),
                                Text("Pasiekimai",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      height: 1.6,
                                    ))
                              ]),
                            ),
                          )
                        ]))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectList()));
                        },
                        child: Column(children: <Widget>[
                          SizedBox(
                            width: 130.0,
                            height: 130.0,
                            child: Card(
                              color: const Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                                Icon(cog, color: Colors.red, size: 63.5),
                                Text("Nustatymai",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      height: 1.55,
                                    ))
                              ]),
                            ),
                          )
                        ])))
              ])))
        ])));
  }
}
