import 'package:flutter/material.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> iconlist = [];
  late bool answer;
  void Checkans(bool userpicked) {
    answer = quizBrain.GetQuestionAns();
    if (answer == userpicked) {
      iconlist.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    } else {
      iconlist.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    }
    quizBrain.GetNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      quizBrain.GetQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Checkans(true);
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const SizedBox(
                        height: 60,
                        child: Center(
                            child: Text(
                          "True",
                          style: TextStyle(fontSize: 20),
                        )),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Checkans(false);
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const SizedBox(
                        height: 60,
                        child: Center(
                            child: Text(
                          "False",
                          style: TextStyle(fontSize: 20),
                        )),
                      )),
                ),
                Row(
                  children: iconlist,
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
