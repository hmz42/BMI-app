import 'dart:math';

import 'package:flutter/material.dart';

import 'bmiResult.dart';

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  bool isMale = true;
  double height = 120;
  double weight = 50;
  double age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: isMale ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: isMale ? Colors.grey : Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                )),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${weight.round()}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${age.round()}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                        ],
                      )),
                )
              ],
            ),
          )),
          Container(
              color: Colors.blue[900],
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  print(result.round());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => resulte(
                                Resulte: result,
                                isMale: isMale,
                                age: age,
                              )));
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
