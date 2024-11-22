import 'dart:math';

import 'package:flutter/material.dart';

class RotatingBox extends StatefulWidget {
  const RotatingBox({super.key});

  @override
  State<RotatingBox> createState() => _RotatingBoxState();
}

class _RotatingBoxState extends State<RotatingBox>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _controller2;
  late Animation<double> _animation2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(
        reverse: true,
      );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ).drive(
      Tween<double>(begin: 0, end: pi ),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(
        reverse: true,
      );

    _animation2 = CurvedAnimation(
      parent: _controller2,
      curve: Curves.elasticOut,
    ).drive(
      Tween<double>(begin: 0, end: pi * 2),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _animation2,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation2.value,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
