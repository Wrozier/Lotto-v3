import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Random random = Random();
  int number1 = 0;
  int number2 = 0;
  int number3 = 0;

  void _generateRandomNumbers() {
    setState(() {
      number1 = random.nextInt(10);
      number2 = random.nextInt(10);
      number3 = random.nextInt(10);
    });
  }

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.network(
            "https://assets8.lottiefiles.com/packages/lf20_eqrl85ln.json",
            repeat: true,
            reverse: true,
            animate: true,
          ),
          Text(
            "Random Numbers",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberBox(number1),
              _buildNumberBox(number2),
              _buildNumberBox(number3),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _generateRandomNumbers,
        icon: Icon(Icons.refresh),
        label: Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildNumberBox(int number) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

