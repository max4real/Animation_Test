import 'package:flutter/material.dart';

class LineLoading extends StatefulWidget {
  const LineLoading({super.key});

  @override
  State<LineLoading> createState() => _LineLoadingState();
}

class _LineLoadingState extends State<LineLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(
        reverse: true,
      );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ).drive(
      Tween<double>(begin: 50, end: 200),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            );
          },
        ),
      ),
    );
  }
}
