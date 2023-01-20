
import 'package:flutter/material.dart';
import 'package:learn_flutter1/questions.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int index;
  final Function answerQuestion;

  const Quiz({
    super.key,
    required this.index,
    required this.answerQuestion, required this.question
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[index]['questionText'] as String),
        const SizedBox(
          height: 20,
        ),
        ...(question[index]['answerText'] as List<Map<String, Object>>).map((answer) {
          return Answer((answer['ans'] as String), unPressed: ()=> answerQuestion(answer['score']));
        }).toList()
      ],
    );
  }
}
