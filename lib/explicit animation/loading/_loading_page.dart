import 'package:animation_test/explicit%20animation/loading/bouncing_ball.dart';
import 'package:animation_test/explicit%20animation/loading/line_loading.dart';
import 'package:animation_test/explicit%20animation/loading/moving%20_circle.dart';
import 'package:animation_test/explicit%20animation/loading/pulsating_circle.dart';
import 'package:animation_test/explicit%20animation/loading/rotating_box.dart';
import 'package:animation_test/explicit%20animation/loading/square_loading.dart';
import 'package:animation_test/explicit%20animation/loading/twist_loading.dart';
import 'package:animation_test/explicit%20animation/loading/wave_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPages extends StatefulWidget {
  const LoadingPages({super.key});

  @override
  State<LoadingPages> createState() => _LoadingPagesState();
}

class _LoadingPagesState extends State<LoadingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SquareLoading());
            },
            child: Text("Square Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const WaveLoading());
            },
            child: Text("Wave Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const TwistLoading());
            },
            child: Text("Twist Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const RotatingBox());
            },
            child: Text("Rotating Box"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const PulsatingCircle());
            },
            child: Text("Pulsating Circle"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const MovingCircle());
            },
            child: Text("Moving Circle"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const LineLoading());
            },
            child: Text("Line Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const BouncingBall());
            },
            child: Text("Bounce Loading"),
          ),
        ],
      ),
    );
  }
}
