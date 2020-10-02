import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name;

  int showdata;
  bool shouldEnable = false;
  var rand = Random();

  int setRandom() {
    int relation;
    setState(() {
      relation = rand.nextInt(100);
    });
    return relation;
  }
// this is a sample comment
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Calulator"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Image.asset(
                "images/heart2.png",
                height: 150,
                width: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      if (value.length != 0) {
                        setState(() {
                          shouldEnable = true;
                        });
                      } else if (value.length == 0) {
                        setState(() {
                          shouldEnable = false;
                        });
                      }
                      name = value;
//                      setState(() {
//
//                      });
                    },
                    validator: (value) => name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)),
                      hintText: 'Enter your name',
                      labelText: 'Your Name',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                          child: Text("Lover"),
                          onPressed: !shouldEnable
                              ? null
                              : () {
                                  showdata = setRandom();
                                }),
                      RaisedButton(
                          child: Text("Sister"),
                          onPressed: shouldEnable
                              ? () {
                                  showdata = setRandom();
                                }
                              : null),
                      RaisedButton(
                          child: Text("Friend"),
                          onPressed: shouldEnable
                              ? () {
                                  showdata = setRandom();
                                }
                              : null),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                          child: Text("Mother"),
                          onPressed: shouldEnable
                              ? () {
                                  showdata = setRandom();
                                }
                              : null),
                      RaisedButton(
                          child: Text("Father"),
                          onPressed: shouldEnable
                              ? () {
                                  showdata = setRandom();
                                }
                              : null),
                      RaisedButton(
                          child: Text("Brother"),
                          onPressed: shouldEnable
                              ? () {
                                  showdata = setRandom();
                                }
                              : null),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: (showdata == null) && (name == null)
                ? Text("")
                : Text("$name loves you $showdata%"),
          ),
        ],
      ),
    );
  }
}
