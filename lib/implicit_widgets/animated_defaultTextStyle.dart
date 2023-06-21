import 'package:flutter/material.dart';

class AnimatedUI2 extends StatefulWidget {
  const AnimatedUI2({super.key});

  @override
  State<AnimatedUI2> createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<AnimatedUI2> {
  Color myColor = Colors.red;
  double myFontSize = 30;
  FontWeight myFontWeight = FontWeight.w300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
                child: Text('Muhammed Nady'),
                style: TextStyle(
                    color: myColor,
                    fontSize: myFontSize,
                    fontWeight: myFontWeight),
                duration: const Duration(seconds: 1)),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    myColor = Colors.green;
                    myFontSize = 50;
                    myFontWeight = FontWeight.w900;
                  });
                },
                child: const Text('Trigger Animation')),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    myColor = Colors.red;
                    myFontSize = 30;
                    myFontWeight = FontWeight.w300;
                  });
                },
                child: const Text('return Animation')),
          ],
        ),
      ),
    );
  }
}
