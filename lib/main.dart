import 'package:flutter/services.dart';
import 'package:matematika/achievements.dart';
import 'package:matematika/test_firebase_con.dart';
import 'package:flutter/material.dart';
import 'package:matematika/list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matematika/Login_Screen.dart';
import 'package:matematika/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
  runApp(MaterialApp(home: MainMenu()));
}

class MainMenu extends StatefulWidget {
  MainState createState() => MainState();
}

class MainState extends State<MainMenu> {
  // Icons
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;
  final globalKey = GlobalKey<ScaffoldState>();
  bool? isChecked;

  static const IconData award =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pencilSquared =
      IconData(0xf14b, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  // Menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
        backgroundColor: Colors.black,
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 21, 21, 21),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                tileColor: const Color.fromARGB(255, 21, 21, 21),
                textColor: Colors.white,
                leading: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 50),
                title: Text(getName()!, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                tileColor: const Color.fromARGB(255, 21, 21, 21),
                textColor: Colors.white,
                title: const Text("Rodyti paaiškinimus", style: TextStyle(fontSize: 20)),
                trailing: Checkbox(
                  value: isChecked ?? false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.green,
                  onChanged: (bool? newValue) {
                      setState(() {
                        isChecked = newValue!;
                      });
                  },
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                tileColor: const Color.fromARGB(255, 21, 21, 21),
              ),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                tileColor: const Color.fromARGB(255, 58, 56, 56),
                textColor: Colors.red,
                leading: const Icon(Icons.exit_to_app, color: Colors.red, size: 40),
                title: const Text("Atsijungti", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onTap: () {
                  setNull(null);
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ),
        body: SafeArea(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      user = getConnected();
                      if (user != null)
                      {
                          globalKey.currentState!.openDrawer();
                      }
                      else
                      {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                      }                
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectList(rodyti: isChecked ?? false)));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TestList(rodyti: isChecked ?? false)));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Achievements()));
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
                          SystemNavigator.pop();
                        },
                        child: Column(children: <Widget>[
                          SizedBox(
                            width: 130.0,
                            height: 130.0,
                            child: Card(
                              color: const Color.fromARGB(255, 21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.exit_to_app, color: Colors.red, size: 63.5),
                                    Text("Išeiti",
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
