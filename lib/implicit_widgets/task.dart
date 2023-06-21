import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<Task> {
  double height1 = 300;
  double width1 = 60.0;
  double left1 = 10.0;
  Color color1 = Colors.green;
  double padding1 = 80;
  double opacity1 = 0.5;
  double fontSize1 = 15;
  Color textColor1 = Colors.white;

  double height2 = 300;
  double width2 = 60.0;
  double left2 = 80.0;
  Color color2 = Colors.red;
  double padding2 = 80;
  double opacity2 = 0.5;
  double fontSize2 = 15;
  Color textColor2 = Colors.white;

  double height3 = 300;
  double width3 = 60.0;
  double left3 = 150.0;
  Color color3 = Colors.blue;
  double padding3 = 80;
  double opacity3 = 0.5;
  double fontSize3 = 15;
  Color textColor3 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(height: 400, width: double.infinity),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  color: color1,
                  child: AnimatedPadding(
                    padding: EdgeInsets.only(top: padding1),
                    duration: Duration(seconds: 2),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: AnimatedOpacity(
                        opacity: opacity1,
                        duration: Duration(seconds: 2),
                        child: Column(
                          children: [
                            AnimatedDefaultTextStyle(
                                child: Text('PHP'),
                                style: TextStyle(
                                    fontSize: fontSize1, color: textColor1),
                                duration: Duration(seconds: 2)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                height: height1,
                width: width1,
                left: left1,
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  color: color2,
                  child: AnimatedPadding(
                    padding: EdgeInsets.only(top: padding2),
                    duration: Duration(seconds: 2),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: AnimatedOpacity(
                        opacity: opacity2,
                        duration: Duration(seconds: 2),
                        child: Column(
                          children: [
                            AnimatedDefaultTextStyle(
                                child: Text('Rect'),
                                style: TextStyle(
                                    fontSize: fontSize2, color: textColor2),
                                duration: Duration(seconds: 2)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                height: height2,
                width: width2,
                left: left2,
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  color: color3,
                  child: AnimatedPadding(
                    padding: EdgeInsets.only(top: padding3),
                    duration: Duration(seconds: 2),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: AnimatedOpacity(
                        opacity: opacity3,
                        duration: Duration(seconds: 2),
                        child: Column(
                          children: [
                            AnimatedDefaultTextStyle(
                                child: Text('Flutter'),
                                style: TextStyle(
                                    fontSize: fontSize3, color: textColor3),
                                duration: Duration(seconds: 2)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                height: height3,
                width: width3,
                left: left3,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      height1 = 400;
                      width1 = 60.0;
                      left1 = 150.0;
                      color1 = Colors.teal;
                      padding1 = 80;
                      opacity1 = 1.0;
                      fontSize1 = 25;
                      textColor1 = Colors.white;

                      height2 = 200;
                      width2 = 60.0;
                      left2 = 220.0;
                      color2 = Colors.orange;
                      padding2 = 60;
                      opacity2 = 1.0;
                      fontSize2 = 25;
                      textColor2 = Colors.blue;

                      height3 = 250;
                      width3 = 60.0;
                      left3 = 290.0;
                      color3 = Colors.pink;
                      padding3 = 120;
                      opacity3 = 1.0;
                      fontSize3 = 20;
                      textColor3 = Colors.black;
                    });
                  },
                  child: const Text('Trigger Animation')),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      height1 = 300;
                      width1 = 60.0;
                      left1 = 10.0;
                      color1 = Colors.green;
                      padding1 = 80;
                      opacity1 = 0.5;
                      fontSize1 = 15;
                      textColor1 = Colors.white;

                      height2 = 300;
                      width2 = 60.0;
                      left2 = 80.0;
                      color2 = Colors.red;
                      padding2 = 80;
                      opacity2 = 0.5;
                      fontSize2 = 15;
                      textColor2 = Colors.white;

                      height3 = 300;
                      width3 = 60.0;
                      left3 = 150.0;
                      color3 = Colors.blue;
                      padding3 = 80;
                      opacity3 = 0.5;
                      fontSize3 = 15;
                      textColor3 = Colors.white;
                    });
                  },
                  child: const Text('return Animation')),
            ],
          )
        ],
      ),
    );
  }
}
