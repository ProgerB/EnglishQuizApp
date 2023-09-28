// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './widgets/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  List<Map<String, dynamic>> QuestionsAndAnswers = [
    {
      "question": "1.What ___ your name?",
      "answers": [
        {"text": "is", "result": true},
        {"text": "are", "result": false},
        {"text": "am", "result": false},
        {"text": "an", "result": false},
      ]
    },
    {
      "question": "2.How ___ you?",
      "answers": [
        {"text": "the", "result": false},
        {"text": "an", "result": false},
        {"text": "is", "result": false},
        {"text": "are", "result": true},
      ]
    },
    {
      "question": "3.Where ___ you live?",
      "answers": [
        {"text": "are", "result": false},
        {"text": "am", "result": false},
        {"text": "does", "result": false},
        {"text": "do", "result": true},
      ]
    },
  ];

  var index = 0;
  var correctanswer = 0;
  void answerQuestion(bool result) {
    setState(() {
      if (result) {
        correctanswer++;
      }
      index++;
    });
  }

  void clear() {
    setState(() {
      index = 0;
      correctanswer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // darkTheme: ThemeData.from(colorScheme: const ColorScheme.light()),
      home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Ingliz tili quizz "),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: index < QuestionsAndAnswers.length
                ? Savol(
                    question: QuestionsAndAnswers[index]["question"],
                    answers: QuestionsAndAnswers[index]["answers"],
                    answerQuestions: answerQuestion,
                    backToQuestions: clear,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "Natija $correctanswer/${QuestionsAndAnswers.length}",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      TextButton(
                        onPressed: clear,
                        child: Text(
                          "Testga qaytish",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 131, right: 131),
                        child: ElevatedButton.icon(
                            onPressed: clear,
                            icon: Icon(Icons.restart_alt),
                            label: Text("Restart")),
                      )
                    ],
                  ),
          )),
    );
  }
}
