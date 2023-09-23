import 'package:flutter/material.dart';

class QuestionsResult extends StatelessWidget {
  const QuestionsResult({required this.resultData, super.key});

  final List<Map<String, Object>> resultData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: resultData.map((data) {
            Color checkAnswer() {
              if ((data['correct_answer'] as String) ==
                  (data['user_answer'] as String)) {
                return Colors.white54;
              } else {
                return Colors.red;
              }
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: checkAnswer(),
                  foregroundColor: Colors.black,
                  child: Text(((data['question_index'] as int) + 1).toString()),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Correct Answer:   ' +
                            (data['correct_answer'] as String),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 216, 172, 41),
                          fontSize: 10,
                        ),
                      ),
                      //const SizedBox(height: 5,),
                      Text(
                        'Your Answer:   ' + (data['user_answer'] as String),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 167, 64, 57),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
