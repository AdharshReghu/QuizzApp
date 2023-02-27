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
                    "This is where question is displayed",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        iconlist.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: SizedBox(
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
                      setState(() {
                        iconlist.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: SizedBox(
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
