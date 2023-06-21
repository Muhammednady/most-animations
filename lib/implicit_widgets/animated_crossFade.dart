import 'package:flutter/material.dart';

class AnimatedUI1 extends StatefulWidget {
  const AnimatedUI1({super.key});

  @override
  State<AnimatedUI1> createState() => _AnimatedUIState();
}

class _AnimatedUIState extends State<AnimatedUI1> {
  bool  isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
             firstChild: Container(color: Colors.red,height: 100,width: 100,),
             secondChild: Container(color: Colors.green,height: 300,width: 300,),
             crossFadeState:isFirst ? CrossFadeState.showFirst: CrossFadeState.showSecond,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFirst = !isFirst;
                   
                  });
                },
                child: const Text('Trigger Animation')),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    
                  });
                },
                child: const Text('return Animation')),
          ],
        ),
      ),
    );
  }
}
