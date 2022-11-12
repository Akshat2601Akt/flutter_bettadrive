class Question {
  late String questionText;
  late String optionA;
  late String optionB;
  late String optionC;
  late String correctOption;

  Question(String q, String a, String b, String c, String o) {
    questionText = q;
    optionA = a;
    optionB = b;
    optionC = c;
    correctOption = o;
  }
}
