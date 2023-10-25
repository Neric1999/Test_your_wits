// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:exercise/data/questions.dart';
// import 'package:exercise/brain_game.dart';
import 'package:exercise/summary_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'chosen_answer': chosenAnswers[i],
          'correct_answer': questions[i].answers[0]
        },
      );
      // print(summary);
    }
    return summary;
  }

  @override
  Widget build(context) {
    final newSummary = getSummaryData();
    final numQuestions = questions.length;
    final numCorrectAnswer = newSummary.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectAnswer questions right out of $numQuestions questions!',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(150, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              SummaryData(newSummary),
              const SizedBox(
                height: 40,
              ),
              OutlinedButton.icon(
                onPressed: onRestartQuiz,
                icon: const Icon(Icons.refresh),
                label: Text(
                  'Restart the Quiz',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 6, 0, 0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
