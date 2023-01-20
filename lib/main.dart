import 'package:flutter/material.dart';
import 'package:learn_flutter1/quiz.dart';
import 'package:learn_flutter1/result.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'Guess my fav color?',
      'answerText': [
        {'ans': 'Red', 'score': 0},
        {'ans': 'Blue', 'score': 1},
        {'ans': 'Green', 'score': 0},
        {'ans': 'Black', 'score': 0}
      ]
    },
    {
      'questionText': 'Guess my fav pet?',
      'answerText': [
        {'ans': 'Dog', 'score': 0},
        {'ans': 'Cat', 'score': 0},
        {'ans': 'Rabbit', 'score': 0},
        {'ans': 'Tiger', 'score': 1}
      ]
    },
    {
      'questionText': 'Guess my fav day?',
      'answerText': [
        {'ans': 'Sunday', 'score': 0},
        {'ans': 'Monday', 'score': 0},
        {'ans': 'Friday', 'score': 0},
        {'ans': 'Holiday', 'score': 1}
      ]
    }
  ];
  int _index = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    
    _totalScore = _totalScore + score;

  
    setState(() {
      _index++;
      print('Answer chosen!');
    });
    if (_index < questions.length) {
      print('We have more Questions.');
    } else {
      print('No more questions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text('How much do you know me?'),
        ),
        body: _index < questions.length
            ? Quiz(
                question: questions,
                index: _index,
                answerQuestion: _answerQuestion)
            :  Result(score: _totalScore,_resetQuiz),
        
      ),
    );
  }
}
