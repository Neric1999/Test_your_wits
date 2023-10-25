import 'package:flutter/material.dart';
import 'package:exercise/start_screen.dart';
import 'package:exercise/questions_screen.dart';
import 'package:exercise/data/questions.dart';
import 'package:exercise/results_screen.dart';

class Brain extends StatefulWidget {
  const Brain({super.key});
  @override
  State<Brain> createState() {
    return _BrainState();
  }
}

var currentScreen = 'start-screen';

class _BrainState extends State<Brain> {
  List<String> selectedAnswers = [];

  void addingAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  void onRestartQuiz() {
    setState(() {
      selectedAnswers = [];
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (currentScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: addingAnswers,
      );
    }

    if (currentScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestartQuiz: onRestartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 239, 146, 146),
                Color.fromARGB(255, 231, 181, 181),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
