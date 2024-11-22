import 'package:flutter/material.dart';

class BouncingBall extends StatefulWidget {
  const BouncingBall({super.key});

  @override
  State<BouncingBall> createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 500), // Longer duration for better bounce
    )..repeat(
        reverse: true, // Let it bounce naturally
      );

    _animation = CurvedAnimation(
      parent: _controller,
      // curve: Curves.fastLinearToSlowEaseIn,
      curve: Curves.easeInCubic,

    ).drive(
      Tween<double>(
        begin: 0,
        end: 50, // Higher end value for more dramatic bounce
      ),
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
        child: SizedBox(
          width: 100,
          height: 400, // Space for the ball to bounce
          child: Stack(
            alignment:
                Alignment.bottomCenter, // Keep the ball centered horizontally
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Positioned(
                    top: _animation.value, // Animate the vertical position
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
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
