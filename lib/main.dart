import 'package:bmi_calculator/homepage.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI Calculator')),
          backgroundColor: Colors.indigo.shade400,
        ),
        body: const Homepage()  
      ),
    ); 
  }
}
