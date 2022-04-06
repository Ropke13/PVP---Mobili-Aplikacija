import 'dart:math';

int generateRandom(int min, int max) {
  return min + Random().nextInt(max - min);
}

// returns [question, answer, explanation]
List<String> generateNewQuestion() {
  int digit1 = generateRandom(1, 10); // [1; 10)
  int digit2 = generateRandom(1, 10); // [1; 10)
  String answer = (digit1 * digit2).toString();

  String explain = "Sudauginus $digit1 su $digit2 gauname $answer";

  return ["Kiek yra " + digit1.toString() + "*" + digit2.toString() + "?", answer, explain];
}
