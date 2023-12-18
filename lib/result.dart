import 'package:flutter/material.dart';


class resultPage extends StatelessWidget {
  const resultPage({super.key});

  @override
  Widget build(BuildContext context) {

    var data;
    data = ModalRoute.of(context)!.settings.arguments;
    if (data['right'] >= 2) {
      
      return Scaffold(
        // appBar: AppBar() ,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(data['right'].toString()),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(28, 107, 0, 2),
                ),
                width: double.infinity,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   const Expanded(
                      child:  SizedBox(
                        height: 60,
                      ),
                    ),
                    const Text(
                      "Congratulations",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    const Text(
                      "you completed the questions",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                   const Expanded(
                      child:  SizedBox(
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/jam.png",
                        width: 200,
                      ),
                    ),
                    Expanded(
                      child: const SizedBox(
                        height: 30,
                      ),
                    ),
                    const Text(
                      "You win",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 300,
              color: const Color.fromRGBO(45, 46, 53, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "rightAnswer: ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        data['right'].toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "fallAnswer:  ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        data['fall'].toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
                const   Expanded(
                    child: SizedBox(
                      height: 90,
                    ),
                  ),
                    SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                Color.fromRGBO(28, 107, 0, 2),
                              ),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)))),
                          onPressed: () {
                            Navigator.pushNamed(context, "/play");
                          },
                          child: const Text(
                            "Start Again",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                   
                    Expanded(child: SizedBox()),
                  
                ],
              ),
            ),
          ],
        )),
      );
      ////// Scafold 2
    } else {
      return Scaffold(
        // appBar: AppBar() ,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(data['right'].toString()),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                width: double.infinity,
                height: 500,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const Expanded(
                      child: SizedBox(
                        height: 250,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Fall Answer",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 300,
              color: const Color.fromRGBO(45, 46, 53, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const  Expanded(
                    child:  SizedBox(
                      height: 100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "rightAnswer: ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        data['right'].toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "fallAnswer:  ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        data['fall'].toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
                 const Expanded(
                    child:  SizedBox(
                      height: 90,
                    ),
                  ),
                   SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Colors.red,
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {
                          Navigator.pushNamed(context, "/play");
                        },
                        child: const Text(
                          "Start Again",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                 
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ],
        )),
      );
    }
  }
}
