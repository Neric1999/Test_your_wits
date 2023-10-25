import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;

    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCorrectAnswer
              ? Colors.deepPurple
              : const Color.fromARGB(255, 183, 58, 85),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          questionNumber.toString(),
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16,
          ),
          // textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
