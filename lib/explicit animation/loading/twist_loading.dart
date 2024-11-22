import 'dart:math';

import 'package:flutter/material.dart';

class TwistLoading extends StatefulWidget {
  const TwistLoading({super.key});

  @override
  State<TwistLoading> createState() => _TwistLoadingState();
}

class _TwistLoadingState extends State<TwistLoading>
    with SingleTickerProviderStateMixin {
  final double size = 20;
  final Color dot1 = Colors.red;
  final Color dot2 = Colors.black;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:1500),
    )..repeat(
      reverse: true
    );

    _rotationAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ).drive(
      Tween<double>(begin: 0, end: pi),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value, // Use animated angle
              child: SizedBox(
                width: size * 2 + size * 0.3,
                // height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: dot1,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: dot2,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
