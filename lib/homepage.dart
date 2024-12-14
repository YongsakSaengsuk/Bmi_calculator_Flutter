import 'package:bmi_calculator/bmi_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      weight = double.parse(weightController.text);
      height = double.parse(heightController.text);

      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             Text('Input your height (cm)',
                style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 20))),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your height',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your height';
                }
                if (double.tryParse(value) == null ||
                    double.parse(value) <= 0) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text('Input your weight (kg)',
                style: TextStyle(fontSize: 20)),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your weight',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your weight';
                }
                if (double.tryParse(value) == null ||
                    double.parse(value) <= 0) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  bmicalculation();
                }
              },
              child: const Text('Submit'),
            ),
            Text('${bmi.toStringAsFixed(2)} ${getBMICategory(bmi)}'),
          ],
        ),
      ),
    );
  }
}
