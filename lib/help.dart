import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session_next/session_next.dart';

class helpPage extends StatelessWidget {
  const helpPage({super.key});

  @override
  Widget build(BuildContext context) {
     final _myBox = Hive.box('myBox');
    var session = SessionNext();
    session.set('june', 3);
    return Scaffold(
      backgroundColor: const Color.fromARGB(229, 246, 253, 255),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.search),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/image3.avif", width: 300),
                ),
                SizedBox(
                  height: 30,
                ),
                const Text(
                  "How You \n         Fell World?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur\n ad piscing eit, sed do eiusmod tempor\n incididunt ut labore et dolore magna aliqua\n Ut enim ad minim veniam, quis nostrud\n exercitation ullamco labons nisi ut aliquip\n exeacommоdо consecuar",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 90),
                Center(
                  child: Text(
                    "Read More about Us",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.expand_more_sharp,
                    size: 30,
                    color: Colors.lightBlue,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 350,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(0, 34, 110,2)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
              onPressed: () {
               
               if (_myBox.get('june') <= 0) {
                           session.start(sessionTimeOut: 10,onExpire: () => {_myBox.put('june', 3)});
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: 'Your chance is over',
                        );
                   
                       
                      }else{
                      Navigator.pushNamed(context, "/play");
                      }
              },
              child: Text("Start test"),
            ),
          ),
        ],
      ),
    );
  }
}
