class Question {
  String questionText;
  bool isCorrect;
  String reponseCorrect = "votre reponse est correct";
  String reponseFaux = "votre reponse nest pas correct";
  String reposne = "reponse";
  Question({required this.questionText, required this.isCorrect});

  String getReponseCorrect() => reponseCorrect;
  String getReponseFaux() => reponseCorrect;
  String get questionTexte => questionText;
  get isCorrectr => isCorrect;
  set isCorrectR(bool b) {
    isCorrect = b;
  }

  set questionTextR(String q) {
    this.questionText = q;
  }
}
