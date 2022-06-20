import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? user = null;

int correct = 0;
int correctTotal = 0;
int countQuestions = 0;
List<int> visitedThemes = [];

User? getConnected() {
  return user;
}

int getCorrect() {
  return correct;
}

int getCountQuestions() {
  return countQuestions;
}

int getCorrectTotal() {
  return correctTotal;
}

void addTheme(int index) {
  if (!visitedThemes.contains(index)) {
    print("Added " + index.toString());
    visitedThemes.add(index);
  }
}

int visitedThemeCount() {
  return visitedThemes.length;
}

void addCorrect() {
  correct++;
  correctTotal++;
}

void countQ() {
  countQuestions++;
}

void resetCounts() {
  correct = 0;
  countQuestions = 0;
}

void setConnected(User u) {
  user = u;
}

void setNull(Null n) {
  user = n;
}

String? getName() {
  if (user != null) {
    return user?.email;
  } else {
    return "";
  }
}

int generateRandom(int min, int max) {
  return min + Random().nextInt(max - min);
}

bool regexCheck(String regex, String input) {
  RegExp exp = RegExp(regex, caseSensitive: false, unicode: true);

  return exp.hasMatch(input);
}

Future<Map<String, dynamic>?> generateQuestion(String theme) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(theme).get();

  int index = generateRandom(0, querySnapshot.size);

  Map<String, dynamic>? data =
      querySnapshot.docs[index].data() as Map<String, dynamic>?;

  return data;
}
