import 'package:flutter/material.dart';
import 'package:quiz_app_/data/questions.dart';
import 'package:quiz_app_/question_screen.dart';
import 'package:quiz_app_/result_screen.dart';
import 'package:quiz_app_/start_quiz.dart';

class Quiz extends StatefulWidget {
   const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();  
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;


  @override
  void initState() {
    super.initState();
    activeScreen = StartQuiz(switchScreen);
  }

    void chosenAnswer(String ans) {
      selectedAnswers.add(ans);

      if (selectedAnswers.length == questions.length) {
        setState(() {
          //selectedAnswers = [];
          activeScreen = ResultScreen(
            selectedAnswers: selectedAnswers,
            onRestart: restartQuiz,
            );
        });
      }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartQuiz(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectedAnswer: chosenAnswer,
        );
    });
  } 

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
      decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 142, 222),
              Color.fromARGB(255, 87, 141, 227),
              Color.fromARGB(255, 118, 186, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
          ),
          child: activeScreen,
        ),
      ),
    );
  } 
}