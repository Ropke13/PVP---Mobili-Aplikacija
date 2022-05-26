import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

int generateRandom(int min, int max) {
  return min + Random().nextInt(max - min);
}

bool regexCheck(String regex, String input) {
  RegExp exp = RegExp(regex, caseSensitive: false, unicode: true);

  return exp.hasMatch(input);
}

Future<Map<String, dynamic>?> generateQuestion(String theme) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance
          .collection(theme)
          .get();

    int index = generateRandom(0, querySnapshot.size);

    Map<String, dynamic>? data = querySnapshot.docs[index].data() as Map<String, dynamic>?;

    return data;
}
