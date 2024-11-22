import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SquareLoading extends StatefulWidget {
  const SquareLoading({super.key});

  @override
  State<SquareLoading> createState() => _SquareLoadingState();
}

class _SquareLoadingState extends State<SquareLoading> {
  Timer timer = Timer(Duration.zero, () {});

  ValueNotifier<double> r1 = ValueNotifier(45);
  ValueNotifier<double> r2 = ValueNotifier(45);
  ValueNotifier<double> r3 = ValueNotifier(45);
  double index = 0;
  final speed = 10;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) => move());
    super.initState();
  }

  void move() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1000 ~/ 60),
      (timer) {
        if (index == 0) {
          r1.value = r1.value + speed;
          index = 1;
        } else if (index == 1) {
          r2.value = r2.value + speed;
          index = 2;
        } else if (index == 2) {
          r3.value = r3.value + speed;
          index = 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: r1,
                builder: (context, r1, child) {
                  return Transform.rotate(
                    angle: r1 * pi / 180,
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: r2,
                builder: (context, r2, child) {
                  return Transform.rotate(
                    angle: r2 * pi / 180,
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: r3,
                builder: (context, r3, child) {
                  return Transform.rotate(
                    angle: r3 * pi / 180,
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
