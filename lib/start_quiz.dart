import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz(this.startQuestion,{super.key});

  final void Function() startQuestion;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz.png',
            width: 350,
            //color: const Color.fromARGB(106, 255, 255, 255), //For transparent Image
          ),
      
          //Image added
      
          const SizedBox(height: 20,),
          Text("Master the building blocks of efficiency!",
          style: GoogleFonts.stickNoBills(
            color: Colors.white,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
          ),
      
          //Text added
      
          const SizedBox(height: 30,),
          OutlinedButton.icon(
            onPressed: () {
              startQuestion();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: const Size(150, 50), // Minimum button size (width, height)
            ),
            icon: const Icon(Icons.double_arrow_sharp),
            label: const Text("Start Quiz",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              // fontFamily: "Baskerville",
            ),
            ) 
           )
           
           //Start quiz Button added
        ],
      ),
    );
  }
}