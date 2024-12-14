import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  var weight = 0.0;
  var height = 0.0;
  var bmi = 0.0;
  void bmicalculation() {
    setState(() {
      try {
        weight = double.parse(weightController.text);
        height = double.parse(heightController.text);
        if (weight <= 0 || height <= 0) {
          bmi = 0.0;
          throw Exception('Height and weight must be greater than 0');
        }
        bmi = weight / ((height / 100) * (height / 100));
      }catch (e) {
        bmi = 0.0;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Input your height (cm)'),
        TextField(
          keyboardType: TextInputType.number,
          controller: heightController,
        ),
        const SizedBox(height: 20),
        const Text('Input your weight (kg)'),
        TextField(
          keyboardType: TextInputType.number,
          controller: weightController,
        ),
        ElevatedButton(
          onPressed: bmicalculation,
          child: const Text('Submit'),
        ),
        Text(bmi.toString()),
      ],
    );
  }
}
