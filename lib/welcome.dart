import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session_next/session_next.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _myBox = Hive.box('myBox');
    var session = SessionNext();
    session.set('june', 3);
    
 

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(138, 47, 226, 1),
          Color.fromRGBO(78, 0, 224, 1)
        ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: SizedBox(
                  height: 200,
                ),
              ),
              Image.asset(
                "assets/quiz.png",
                width: 600,
              ),
              const Expanded(
                child: SizedBox(
                  height: 100,
                ),
              ),
              const Text(
                "Welcome to QuizGame",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 248, 248, 0.732)),
              ),
              const Expanded(
                child: SizedBox(
                  height: 100,
                ),
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: Container(
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(0, 34, 110, 2),
                      Color.fromRGBO(0, 34, 110, 2)
                    ]),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                       session.start(
                            sessionTimeOut: 10,
                            onExpire: () => {
                                  _myBox.put('june', 3),
                                });

                      if (_myBox.get('june') <= 0) {
                           session.start(sessionTimeOut: 10,onExpire: () => {_myBox.put('june', 3)});
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: 'Your chance is over',
                        );
                   
                       
                      }else {
                      Navigator.pushNamed(context, "/play");
                      }
                    }, 
                    child: const Text(
                      "play",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(0, 34, 111, 1)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    Navigator.pushNamed(context, "/help");
                  },
                  child: const Text("how to play"),
                ),
              ),
             const Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
