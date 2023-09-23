import 'package:challenges/result_screen.dart';
import 'package:challenges/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:challenges/questions_screen.dart';
import 'package:challenges/data/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(startQuiz: switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          choosenAnswers: selectedAnswers,
          restartQuiz: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Color.fromARGB(255, 105, 190, 211),
            Color.fromARGB(255, 31, 87, 70)
          ], radius: 1.5),
        ),
        child: activeScreen,
      ),
    );
  }
}
