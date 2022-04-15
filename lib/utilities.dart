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

  return ["Kiek yra \\(" + digit1.toString() + "\\cdot" + digit2.toString() + "\\)?", answer, explain];
}

// returns [question, answers, correctAnswer, explanation]
List getNumberQuestion() {
  int index = generateRandom(0, 1);

  switch (index) {
    case 0:
      return [
        "Duotos trys aibės: \\(A=\\{2,3,5,9\\}, B = \\{5,6,9\\}, C=\\{3,5,6,7,8\\}\\). Kuris iš toliau pateiktų teiginių yra klaidingas?",
        [
          "\\((B \\setminus C) \\subset A\\)",
          "\\(A \\cap  B \\cap  C = \\{5\\}\\)",
          "\\(B \\subset A \\)",
          "\\(B \\cup C = \\{3, 5, 6, 7, 8, 9\\}\\)",
        ],
        2,
        """C, nes visi pirmoje aibėje esantys elementai turi būti antroje aibėje: \\(\\{5, 6, 9\\} \\subset \\{ 2,3,5,9\\}\\).
Kadangi šešeto nėra antroje aibėje, tai teiginys yra klaidingas. 
A, B, D teiginiai nėra klaidingi, nes 
A: \\(\\{5,6,9\\} \\setminus \\{ 3,5,6,7,8\\} = \\{9\\}\\) devyni priklauso aibei \\(A=\\{2,3,5,9\\}\\);
B apjungiame bendrus aibės elementus ir gauname: 
\\(A \\cap B = \\{2,3,5,9\\} \\cap \\{5,6,9\\} = \\{5,9\\}, \\{5,9\\} \\cap C = \\{5,9\\} \\cap \\{3,5,6,7,8\\} = \\{5\\}\\);
D sujungiame visus aibių elementus į vieną aibę: \\(B \\cup C = \\{5,6,9\\} \\cup \\{3,5,6,7,8\\} = \\{3, 5, 6, 7, 8, 9\\}\\)"""
      ];
    default:
      throw ("No question");
  }
}
