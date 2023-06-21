import 'package:animations/routing/transition.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page'),),
      body: Container(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(onPressed: (){
            Navigator.of(context).push(AnimatedTransition(page: SecondPage()));
          }, child: Text('Go to Second')),
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second page'),),
      body: Container(
        color: Colors.green,
        child: Center(child: ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child:Icon(Icons.keyboard_return_rounded)),),
      )
      );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
