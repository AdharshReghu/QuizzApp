import 'package:flutter/material.dart';

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
  List<String> questionlist = [
    'Circles have infinite corners',
    'Flutter is an easy framework to build both android and ios applications having different base code',
    'India got independence in 1948'
  ];
  List<bool> Answers = [true, false, false];
  int qnumber = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    questionlist[qnumber],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextButton(
                    onPressed: () {
                      bool correctAns = Answers[qnumber];
                      setState(() {
                        if (correctAns == true) {
                          iconlist.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                        }
                        qnumber++;
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
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextButton(
                    onPressed: () {
                      bool correctAns = Answers[qnumber];
                      setState(() {
                        if (correctAns == false) {
                          iconlist.add(
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          );
                        }
                        qnumber++;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
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
    );
  }
}
