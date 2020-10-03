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
      title: 'Love Calculator',
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
  var msg;
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
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFf56a79),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Love Calulator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "images/love.webp",
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
                            msg = null;
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
                                    setState(() {
                                      msg =
                                          "$name Your lover has $showdata% intimacy towards you.";
                                    });
                                  }),
                        RaisedButton(
                            child: Text("Sister"),
                            onPressed: shouldEnable
                                ? () {
                                    showdata = setRandom();
                                    setState(() {
                                      msg =
                                          "$name Your warm hearted sister is $showdata% empathetic towards you.";
                                    });
                                  }
                                : null),
                        RaisedButton(
                            child: Text("Friend"),
                            onPressed: shouldEnable
                                ? () {
                                    showdata = setRandom();
                                    setState(() {
                                      msg =
                                          "$name Your boon companion loves you $showdata%";
                                    });
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
                                    setState(() {
                                      msg =
                                          "$name Your sensitive mother loves you $showdata%";
                                    });
                                  }
                                : null),
                        RaisedButton(
                            child: Text("Father"),
                            onPressed: shouldEnable
                                ? () {
                                    showdata = setRandom();
                                    setState(() {
                                      msg =
                                          "$name Your sensitive father loves you $showdata%";
                                    });
                                  }
                                : null),
                        RaisedButton(
                            child: Text("Brother"),
                            onPressed: shouldEnable
                                ? () {
                                    showdata = setRandom();
                                    setState(() {
                                      msg =
                                          "$name Your warm hearted brother is $showdata% empathetic towards you.";
                                    });
                                  }
                                : null),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: msg == null
                    ? Text("")
                    : Text(
                        msg,
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
