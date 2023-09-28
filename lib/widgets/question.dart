import 'package:flutter/material.dart';

class Savol extends StatelessWidget {
  const Savol(
      {super.key,
      required this.question,
      required this.answers,
      required this.answerQuestions,
      required this.backToQuestions});
  final String question;
  final List<Map<String, dynamic>> answers;
  final Function answerQuestions;
  final Function backToQuestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
            onPressed: () => answerQuestions(answers[0]["result"]),
            child: Text(
              answers[0]["text"],
              style: const TextStyle(fontSize: 20),
            )),
        ElevatedButton(
            onPressed: () => answerQuestions(answers[1]["result"]),
            child: Text(
              answers[1]["text"],
              style: const TextStyle(fontSize: 20),
            )),
        ElevatedButton(
            onPressed: () => answerQuestions(answers[2]["result"]),
            child: Text(
              answers[2]["text"],
              style: const TextStyle(fontSize: 20),
            )),
        ElevatedButton(
            onPressed: () => answerQuestions(answers[3]["result"]),
            child: Text(
              answers[3]["text"],
              style: const TextStyle(fontSize: 20),
            )),
        FloatingActionButton(
          onPressed: () => backToQuestions(),
          child: (const Text("Restart")),
        )
      ],
    );
  }
}
