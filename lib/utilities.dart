import 'dart:math';

int generateRandom(int min, int max) {
  return min + Random().nextInt(max - min);
}

// returns [question, regex, answer, explanation, isOnlyNumberAnswer]
List generateNewQuestion() {
  int digit1 = generateRandom(1, 10); // [1; 10)
  int digit2 = generateRandom(1, 10); // [1; 10)
  String answer = (digit1 * digit2).toString();

  String regex = "^" + answer + "\$";
  String explain = "Sudauginus $digit1 su $digit2 gauname $answer";

  return ["Kiek yra \\(" + digit1.toString() + "\\cdot" + digit2.toString() + "\\)?", regex, answer, explain, true];
}

bool regexCheck(String regex, String input) {
  RegExp exp = RegExp(regex, caseSensitive: false, unicode: true);

  return exp.hasMatch(input);
}

// returns [question, regex, answer, explanation, isOnlyNumberAnswer]
List getTextQuestion() {
  return [
    r"""Apskaičiuokite skaitinio reiškinio \( \frac{19-6\sqrt{2}}{3 \sqrt{2} - 1} + 1 \) reikšmę.""",
    r"""^\s*3\s*(\*|\skart\s)?\s*([šs]aknis|sqrt|(square\s*)?root)\s*\(?2\)?\s*$""",
    r"""\(3 \sqrt{2}\)""",
    r"""\( \frac{19-6\sqrt{2}}{3 \sqrt{2} - 1} + 1 = \frac{19-6\sqrt{2}}{3\sqrt{2}-1} + \frac{3\sqrt{2}-1}{3\sqrt{2}-1} = \frac{19-6\sqrt{2}+3\sqrt{2}-1}{3\sqrt{2}-1} = \frac{18-3\sqrt{2}}{3\sqrt{2}-1} \cdot \frac{3\sqrt{2}+1}{3\sqrt{2}-1} = \frac{(18-3\sqrt{2})(3\sqrt{2}+1)}{(3\sqrt{2}+1)(3\sqrt{2}-1)} = \frac{54\sqrt{2}+18-9 \cdot 2 - 3 \sqrt{2}}{9\cdot 2 - 1}=\frac{51\sqrt{2}}{17}=3\sqrt{2}\)""",
    false
  ];
}

// returns [question, answers, correctAnswer, explanation]
List getNumberQuestion() {
  int index = generateRandom(0, 2);

  switch (index) {
    case 0:
      return [
        r"""Duotos trys aibės: \( A=\{ 2,3,5,9\}, B = \{ 5,6,9\}, C=\{ 3,5,6,7,8\}\). Kuris iš toliau pateiktų teiginių yra klaidingas?""",
        [
          r"""\((B \setminus C) \subset A\)""",
          r"""\(A \cap  B \cap  C = \{5\}\)""",
          r"""\(B \subset A \)""",
          r"""\(B \cup C = \{3, 5, 6, 7, 8, 9\}\)""",
        ],
        2,
        r"""C, nes visi pirmoje aibėje esantys elementai turi būti antroje aibėje: \(\{5, 6, 9\} \subset \{ 2,3,5,9\}\).
Kadangi šešeto nėra antroje aibėje, tai teiginys yra klaidingas.
A, B, D teiginiai nėra klaidingi, nes
A: \(\{5,6,9\} \setminus \{ 3,5,6,7,8\} = \{9\}\) devyni priklauso aibei \(A=\{2,3,5,9\}\);
B apjungiame bendrus aibės elementus ir gauname:
\(A \cap B = \{2,3,5,9\} \cap \{5,6,9\} = \{5,9\}, \{5,9\} \cap C = \{5,9\} \cap \{3,5,6,7,8\} = \{5\}\);
D sujungiame visus aibių elementus į vieną aibę: \( B \cup C = \{ 5,6,9\} \cup \{3,5,6,7,8\} = \{3, 5, 6, 7, 8, 9\}\)."""
      ];
    case 1:
      return [
        r"""Ar lygčių sistemos
\(\begin{cases}
        y+2x=4 \\
        x-13=5y
    \end{cases}\)
ir

\(\begin{cases}
        3x+5y=9 \\
        4x-y=11
    \end{cases}\)
yra ekvivalenčios?
""",
        ["Taip", "Ne"],
        1,
        r"""
\(\begin{cases}
        y+2x=4 \\
        x-13=5y
    \end{cases}\),
\(x-13=5(4-2x)\),
\(x-13=20-10x\),
\(11x=33\),
\(x=3\),
\(y=4-2\cdot3=-2\).
\(\begin{cases}
    3x+5y=9 \\
    4x-y=11 / \cdot 5
\end{cases}\),
\(\begin{cases}
    3x+5y=9 \\
    20x-5y=55
\end{cases}\),
\( 23x=64\),
\( x=2\frac{18}{23}\),
\( y=4\cdot\frac{64}{23}-11=\frac{3}{23}\)
"""
      ];
    default:
      throw ("No question");
  }
}
