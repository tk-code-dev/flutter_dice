import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text(
            'Dice',
            style: GoogleFonts.spaceMono(
              textStyle: TextStyle(
                  color: Colors.white, letterSpacing: 5.0, fontSize: 40),
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  int diceNum = 2;

  void changeDiceFace() {
    leftDiceNum = Random().nextInt(6) + 1;
    rightDiceNum = Random().nextInt(6) + 1;
    diceNum = leftDiceNum + rightDiceNum;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNum.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNum.png'),
                ),
              )
            ],
          ),
          SizedBox(height: 40),
          Text(
            '$diceNum',
            style: GoogleFonts.spaceMono(
              textStyle: TextStyle(
                  color: Colors.white, letterSpacing: 5.0, fontSize: 100),
            ),
          ),
        ],
      ),
    );
  }
}
