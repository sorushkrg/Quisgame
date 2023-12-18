import 'package:flutter/material.dart';


class fallpage extends StatelessWidget {
  const fallpage({super.key});

  @override
  Widget build(BuildContext context) {
   
 
    
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
                 const Expanded(
                    child:  SizedBox(
                      height: 90,
                    ),
                  ),
                   SizedBox(
                      width: 300,
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
                          Navigator.pushNamed(context, "/home");
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