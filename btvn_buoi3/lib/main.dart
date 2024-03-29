import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class TimeCountDown extends StatefulWidget {
  int time;
  final void Function(int) isCountDownFinish;
  bool isPressButton ;
  TimeCountDown({Key? key, required this.time, required this.isPressButton,
    required this.isCountDownFinish}) : super(key: key);
  @override
  State<TimeCountDown> createState() => _TimeCountDownState(isCountDownFinish);
}

class _TimeCountDownState extends State<TimeCountDown> {
  final void Function(int) isCountDownFinish;

  _TimeCountDownState(this.isCountDownFinish);

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }


  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.time > 0 && !widget.isPressButton) {
          widget.time--;
        } else {
          timer.cancel();
          isCountDownFinish(-1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Thời gian: ${widget.time} s",
      style: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}



class _MyAppState extends State<MyApp> {
  int numberScreen = 1;
  int numberBest = 0;
  int numberCurrent=0;

  void screenChange(int number){
    setState(() {
      numberScreen = number;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: numberScreen ==1 ? homeScreen() : numberScreen == 2
            ? playingScreen() : gameOver(),
      )
    );
  }

  int checkAnswer(bool answerCorrect, int result, int resultDisplay){
    if(answerCorrect){
      if(result == resultDisplay){
        screenChange(2);
        return 5;
      }else{
        screenChange(3);
        return 0;
      }
    }else{
      if(result == resultDisplay){
        screenChange(3);
        return 0;
      }else{
        screenChange(2);
        return 5;
      }
    }
  }

  Widget homeScreen() {
  numberCurrent=0;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14))
                ),
                child: Text("1+1=2", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Freaking", style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),),
                  Text("Math", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),)
                ],
              ),
              SizedBox(height: 100,),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: InkWell(
                    onTap: () {
                      screenChange(2);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                      child: Icon(Icons.play_arrow, color: Colors.blue, size: 35,),
                    )
                ),
              ),
            ],
          )
      ),
    );
  }



  // int = 2
  Widget playingScreen(){
    int signID = Random().nextInt(4) + 1;
    late int number1;
    late int number2;
    late int result ;
    late String sign;
    late int timeCountDown;
    bool isPressButton = false;


    switch(signID){
      case 1:
        sign = "+";
        number1 = Random().nextInt(500);
        number2 = Random().nextInt(500);
        result = number1 + number2;
        timeCountDown = 6;
        break;
      case 2:
        sign = "-";
        number1 = Random().nextInt(500);
        do{
          number2 = Random().nextInt(500);
        }while(number1 < number2);
        result = number1 - number2;
        timeCountDown = 7;
        break;
      case 3:
        sign = "*";
        number1 = Random().nextInt(100);
        number2 = Random().nextInt(100);
        result = number1 * number2;
        timeCountDown = 10;
        break;
      case 4:
        sign = "/";
        number1 = Random().nextInt(500);
        do{
          number2 = Random().nextInt(100);
        }while(number2==0 || number1%number2!=0);
        result = (number1 / number2).round();
        timeCountDown = 8;
        break;
    }
    int resultDisplay = Random().nextInt(3) + (result-2);

    void countDownFinished(int value) {
      if(value==-1){
        screenChange(3);
      }
    }

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                TimeCountDown(time: timeCountDown,isPressButton: isPressButton,
                isCountDownFinish: countDownFinished,),
                  Text("Điểm: $numberCurrent", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
            Container(
              child: Text("$number1$sign$number2", style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Text("=$resultDisplay", style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: InkWell(
                        onTap: () {
                          numberCurrent += checkAnswer(true, result, resultDisplay);
                          setState(() {
                            isPressButton = true;
                          });
                        },
                        child: Icon(Icons.done, color: Colors.blue,size: 150,)
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: InkWell(
                        onTap: () {
                          numberCurrent += checkAnswer(true, result, resultDisplay);
                          setState(() {
                            isPressButton = true;
                          });
                        },
                        child: Icon(Icons.close, color: Colors.red,size: 150,)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //int = 3
  Widget gameOver(){
    if(numberBest < numberCurrent){
      numberBest = numberCurrent;
    }
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text("GAME OVER", style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),),
            ),
            Container(
              child: Text("curent", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),),
            ),
            Container(
              child: Text("$numberCurrent", style: TextStyle(
                  color: Colors.white,
                  fontSize: 35
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("best", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),),
            ),
            Container(
              child: Text("$numberBest", style: TextStyle(
                  color: Colors.white,
                  fontSize: 35
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    child: InkWell(
                        onTap: () {
                          numberCurrent = 0;
                          screenChange(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.replay, size: 80, color: Colors.black.withOpacity(0.7),),
                        )
                    ),
                  ),
                  Material(
                    child: InkWell(
                        onTap: () {
                          screenChange(1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.home, size: 80, color: Colors.black.withOpacity(0.7),),
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}








