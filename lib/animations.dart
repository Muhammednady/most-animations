import 'package:flutter/material.dart';

import 'animate2.dart';

void main() => runApp(const LogoApp());

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }
  static Color _sunColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        child: Image.network('https://img.freepik.com/premium-photo/bright-sun-is-shown-with-sun-center_907077-528.jpg?w=740'),
        onEnd: (){
          setState(() {
            _sunColor = _sunColor == Colors.white ?Colors.red:Colors.white;
          });
        },
        tween: ColorTween(begin: Colors.white,end: Colors.red),
         duration: Duration(seconds: 5),
         curve: Curves.bounceInOut,
          builder: (context, value, child) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
              child: child,

              );
          },
          ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HeroWidget()
    );
  }
}