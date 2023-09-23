class QuizQuestions {
  final String question;
  final List<String> answers;

  const QuizQuestions(this.question, this.answers);

  List<String> get shuffledAnswers {
    List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
