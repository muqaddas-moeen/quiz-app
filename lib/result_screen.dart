import 'package:flutter/material.dart';
import 'package:challenges/data/questions.dart';
import 'package:challenges/questions_result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.restartQuiz});

  final List<String> choosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get resultData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = resultData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answerd $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionsResult(resultData: resultData),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  restartQuiz();
                },
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.black,
                ),
                label: const Text(
                  'restart quiz',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
