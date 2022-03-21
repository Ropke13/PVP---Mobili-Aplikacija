import 'package:flutter/material.dart';
import 'package:projecttest/list.dart';


void main() => runApp(
  MaterialApp(
    home:MainMenu()
  )
);

class MainMenu extends StatelessWidget {

  // Icons
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData award = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cog = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pencilSquared = IconData(0xf14b, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  // Menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubjectList()
                        )
                      );
                    },
                    child: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 60.0)
                  )
                ],
              ),
            ),
            const Center(
              child: Text(
                "Sveikas atvykęs į PAVADINIMAS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Center(
              child: Text(
                "Kur keliausi toliau?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  height: 3
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell( 
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SubjectList()
                            )
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 130.0,
                              height: 130.0,
                              child: Card(
                                color: const Color.fromARGB(255,21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.calculate_rounded, color: Colors.green, size: 72.5),
                                    Text(
                                      "Mokytis",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 1.2,
                                      )
                                    )
                                  ] 
                                ),
                              ),
                            )
                          ] 
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell( 
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SubjectList()
                            )
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 130.0,
                              height: 130.0,
                              child: Card(
                                color: const Color.fromARGB(255,21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(pencilSquared, color: Colors.blue, size: 66),
                                    Text(
                                      "Testai",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 1.45,
                                      )
                                    )
                                  ] 
                                ),
                              ),
                            )
                          ] 
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell( 
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SubjectList()
                            )
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 130.0,
                              height: 130.0,
                              child: Card(
                                color: const Color.fromARGB(255,21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(award, color: Colors.yellow, size: 63.5),
                                    Text(
                                      "Pasiekimai",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 1.6,
                                      )
                                    )
                                  ] 
                                ),
                              ),
                            )
                          ] 
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell( 
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SubjectList()
                            )
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 130.0,
                              height: 130.0,
                              child: Card(
                                color: const Color.fromARGB(255,21, 21, 21),
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(cog, color: Colors.red, size: 63.5),
                                    Text(
                                      "Nustatymai",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 1.55,
                                      )
                                    )
                                  ] 
                                ),
                              ),
                            )
                          ] 
                        )
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}

                    