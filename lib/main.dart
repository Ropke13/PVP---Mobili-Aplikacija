 import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home:MainMenu()
  )
);

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, color: Colors.white,size: 52.0,),
                  Image.asset("profile.png",width: 52.0,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Sveikas atvykęs į PAVADINIMAS\n",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing:20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width: 140.0,
                      height: 140.0,
                      child: Card(
                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("mokytis.png",width: 64.0,),
                              Text(
                                "Mokytis",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  height: 2.0
                                ),
                              )
                            ],
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:140.0,
                      height: 140.0,
                      child: Card(

                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("testai.png",width: 64.0,),
                                  Text(
                                    "Testai",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 2.0
                                    ),
                                  )
                                ],
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:140.0,
                      height: 140.0,
                      child: Card(
                        color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("pasiekimai.jpg",width: 64.0,),
                                  Text(
                                    "Pasiekimai",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 2.0
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
