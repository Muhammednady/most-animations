import 'package:flutter/material.dart';

class AnimatedUI3 extends StatefulWidget {
  const AnimatedUI3({super.key});

  @override
  State<AnimatedUI3> createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<AnimatedUI3> {
  double myPadding = 20;
  double opac = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.teal,
              child: AnimatedOpacity(
                opacity: opac,
                duration: const Duration(seconds: 1),
                child: Text('Animated Padding'),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    opac = 0.5;
                  });
                },
                child: const Text('Trigger Animation')),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    opac = 0;
                  });
                },
                child: const Text('return Animation')),
          ],
        ),
      ),
    );
  }
}
