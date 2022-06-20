import 'package:flutter/material.dart';
import 'package:matematika/main.dart';

var achievementTitles = ['Pasiekimai?', 'Proto bokštas'];
var achievementDescriptions = [
  'Pasiekimai!',
  'Teisingai atsakyta į 10 klausimų'
];
var achieved = [true, false];

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 35),
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainMenu())),
              ),
              title: const Text("Pasiekimai",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold)),
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
            body: Column(children: [
              const Divider(
                  color: Color.fromARGB(255, 21, 21, 21), thickness: 2),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: achievementTitles.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            tileColor: const Color.fromARGB(255, 21, 21, 21),
                            textColor: Colors.white,
                            leading: CircleAvatar(
                              child: Text((index + 1).toString(),
                                  style: TextStyle(
                                    color: achieved[index]
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 30,
                                  )),
                              backgroundColor: Colors.black,
                            ),
                            title: Text(achievementTitles[index],
                                style: const TextStyle(fontSize: 20)),
                            trailing: Icon(
                                achieved[index]
                                    ? Icons.check
                                    : Icons.cancel_outlined,
                                size: 30,
                                color: achieved[index]
                                    ? Colors.green
                                    : Colors.red),
                            onTap: () {
                              final snackBar = SnackBar(
                                content: Text(achievementDescriptions[index]),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                          const Divider(color: Colors.black, thickness: 2),
                        ],
                      );
                    }),
              )
            ])));
  }
}
