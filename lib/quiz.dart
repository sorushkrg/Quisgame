import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class playPage extends StatefulWidget {
  const playPage({super.key});

  @override
  State<playPage> createState() => _playPageState();
}

class _playPageState extends State<playPage> {
  var questions = [];
  var index = 0;
  int rightanswercount = 0;
  int fallAnswercount = 0;
  var response;
  var june = 0;
  final _myBox = Hive.box('myBox');

  Future<List<dynamic>> fetchData() async {

    try {

       var result = await  http.get(Uri.parse("http://sorushkg.iapp.ir/Data.json"));
    questions = jsonDecode(utf8.decode(result.bodyBytes))['result'];

    


      
    } catch (e) {
      
    }
    
    return questions;
    
  }

  void initState() {
    if (_myBox.get('june').toString() == 'null') {
      _myBox.put('june', 3);
    }
    _myBox.put('june', 3);

// _myBox.delete('june');

    response = fetchData();
    super.initState();
  }

  validate(i) {
    if (questions[index]["answerIndex"] == i) {
      setState(() {
        rightanswercount++;
      });
    } else {
      setState(() {
        fallAnswercount++;
        // june++;
        _myBox.put('june', _myBox.get('june') - 1);
      });
    }
    if (_myBox.get('june') <= 0) {
      setState(() {
        Navigator.pushNamed(context, "/fall");
      });
    }

    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      Navigator.pushNamed(context, "/result", arguments: {
        'right': rightanswercount,
        'fall': fallAnswercount,
        'total': questions.length,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text(questions[index]["Level"]),

        foregroundColor: Colors.black,
        title: FutureBuilder(
            future: response,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text(
                  _myBox.get('june').toString(),
                  style: TextStyle(color: Colors.black),
                );
              } else {
                return Text("در حال دریافت اطلاعات");
              }
            }),
          centerTitle: true,


      ),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    color: Color.fromRGBO(0, 34, 111, 10),
                    child: Center(
                      child: Container(
                        child: Expanded(
                          child: Text(
                            questions[index]["question"],
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromRGBO(0, 34, 111, 1)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    onPressed: () async{
                                      await validate(0);
                                    },
                                    child:
                                        Text(questions[index]["options"][0])),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromRGBO(0, 34, 111, 1)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    onPressed: () {
                                      validate(1);
                                    },
                                    child:
                                        Text(questions[index]["options"][1])),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromRGBO(0, 34, 111, 1)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    onPressed: () {
                                      validate(2);
                                    },
                                    child:
                                        Text(questions[index]["options"][2])),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromRGBO(0, 34, 111, 1)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    onPressed: () {
                                      validate(3);
                                    },
                                    child:
                                        Text(questions[index]["options"][3])),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
