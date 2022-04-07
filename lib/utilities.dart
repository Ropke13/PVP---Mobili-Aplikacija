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

// returns [question, answers, correctAnswer, explanation]
List getNumberQuestion() {
  int index = generateRandom(0, 1);

  switch (index) {
    case 0:
      return [
        "Duotos trys aibės:  Kuris iš toliau pateiktų teiginių yra klaidingas?",
        [
          "A",
          "B",
          "C",
          "D",
        ],
        2,
        """C, nes visi pirmoje aibėje esantys elementai turi būti antroje aibėje: . Kadangi šešeto nėra antroje aibėje, tai teiginys yra klaidingas. 
A, B, D teiginiai nėra klaidingi, nes 
A:  devyni priklauso aibei ;
B apjungiame bendrus aibės elementus ir gauname: ;
D sujungiame visus aibių elementus į vieną aibę: """
      ];
    default:
      throw ("No question");
  }
}
