import 'package:animations/animated_list.dart';
import 'package:animations/clip_path/clip_path.dart';
import 'package:animations/implicit_widgets/animatedOpacity_padding.dart';
import 'package:animations/implicit_widgets/animated_container.dart';
import 'package:animations/hero.dart';
import 'package:animations/implicit_widgets/animated_crossFade.dart';
import 'package:animations/implicit_widgets/animated_defaultTextStyle.dart';
import 'package:animations/implicit_widgets/task.dart';
import 'package:animations/routing/routing.dart';
import 'package:animations/staggering_animations.dart';
import 'package:animations/transformer.dart';
import 'package:flutter/material.dart';

import 'animations.dart';
import 'hero_flight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ClipPathView(),
    );
  }
}
