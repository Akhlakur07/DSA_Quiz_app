import 'package:flutter/material.dart';
import 'package:quiz_app_/data/questions.dart';
import 'package:quiz_app_/questions_summary.dart';
//import 'package:quiz_app_/quiz.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({
    super.key, 
    required this.selectedAnswers,
    required this.onRestart,    
    });

  final List<String> selectedAnswers;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i=0; i<selectedAnswers.length; i++){
      summary.add(
        {
        'question_index': i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i]
        }
      );
    }
    return summary;
  }


  @override
  
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrect = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrect out of $numTotalQuestion question correctly!",
              style: const TextStyle(
                color: Color.fromARGB(255, 254, 254, 255),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
            const SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh, 
                    color: Color.fromARGB(255, 243, 223, 250)),
              label: const Text("Restart Quiz",
              style: TextStyle(
                color: Color.fromARGB(255, 243, 223, 250),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),
            )
          ],
        )
        )
        );
  }
}