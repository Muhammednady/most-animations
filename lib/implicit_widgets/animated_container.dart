import 'package:flutter/material.dart';

class AnimatedUI extends StatefulWidget {
  const AnimatedUI({super.key});

  @override
  State<AnimatedUI> createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<AnimatedUI> {
  double myHeight = 100;
  double myWidth = 100;
  Color MyColor = Colors.red;
  double myRadius = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: myHeight,
              width: myWidth,
              decoration: BoxDecoration(
                color: MyColor,
                borderRadius: BorderRadius.circular(myRadius),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    myHeight = 300;
                    myWidth = 300;
                    myRadius = 200;
                    MyColor = Colors.green;
                  });
                },
                child: const Text('Trigger Animation')),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                     myHeight = 100;
                     myWidth = 100;
                     MyColor = Colors.red;
                     myRadius = 100;
                  });
                },
                child: const Text('return Animation')),
          ],
        ),
      ),
    );
  }
}
