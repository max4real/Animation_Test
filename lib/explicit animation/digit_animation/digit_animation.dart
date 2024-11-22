import 'package:flutter/material.dart';

class DigitAnimation extends StatefulWidget {
  const DigitAnimation({super.key});

  @override
  State<DigitAnimation> createState() => _DigitAnimationState();
}

class _DigitAnimationState extends State<DigitAnimation> {
  int result = 100;
  TextEditingController txtnumber = TextEditingController();

  void add() {
    int input = int.tryParse(txtnumber.text) ?? 1;
    setState(() {
      result = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: result),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                );
              },
            ),
            Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                controller: txtnumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey,
                    border: InputBorder.none),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                add();
                txtnumber.clear();
              },
              child: const Text("Count"),
            ),
          ],
        ),
      ),
    );
  }
}
