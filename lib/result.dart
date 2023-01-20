import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int? score;
  final Function resetQuiz;
  const Result( this.resetQuiz,{@required this.score, super.key} );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You scored $score.',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(onPressed: ()=>resetQuiz(), child: const Text('Restart')),
        ],
      ),
    );
  }
}
