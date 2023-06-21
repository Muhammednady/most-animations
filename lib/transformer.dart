import 'package:flutter/material.dart';

 

 class TransformWidget extends StatefulWidget {
   const TransformWidget({super.key});
 
   @override
   State<TransformWidget> createState() => _TransformWidgetState();
 }
 
 class _TransformWidgetState extends State<TransformWidget> {
  double scaleVal = 0.0;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
             transform: Matrix4.rotationX(3.14),
            child: Container(
              color: Colors.red,
              height: 200.0,
              width: 100.0,
              child: Column(children: [
                  Text('Top'),
                  Spacer(),
                  Text('bottom'),
              ],),
            ),
          ),
          SizedBox(height: 10.0,),
          Slider(value: scaleVal,
          min: 0,
          max: 4,
           onChanged:(value){
           
           setState(() {
             scaleVal = value;
           });

          }),
          SizedBox(height: 10,),
          Text('$scaleVal')
          ],
        ),
      ),
    );;
   }
 }