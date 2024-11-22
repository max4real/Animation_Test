import 'package:flutter/material.dart';

class MovingCircle extends StatefulWidget {
  const MovingCircle({super.key});

  @override
  State<MovingCircle> createState() => _MovingCircleState();
}

class _MovingCircleState extends State<MovingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Offset> positions = [
    Offset(50, 50),
    Offset(150, 50),
    Offset(100, 150),
  ]; // Define three positions for the dot.

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ).drive(
      Tween<double>(begin: 0.0, end: 1.0),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currentIndex = (currentIndex + 1) % positions.length;
        });
        _controller.reset();
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset getCurrentPosition() {
    Offset start = positions[currentIndex];
    Offset end = positions[(currentIndex + 1) % positions.length];
    return Offset(
      start.dx + (end.dx - start.dx) * _animation.value,
      start.dy + (end.dy - start.dy) * _animation.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: DotPainter(getCurrentPosition()),
              child: const SizedBox.expand(),
            );
          },
        ),
      ),
    );
  }
}

class DotPainter extends CustomPainter {
  final Offset position;

  DotPainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, 10, paint);
  }

  @override
  bool shouldRepaint(covariant DotPainter oldDelegate) {
    return oldDelegate.position != position;
  }
}
