import 'package:flutter/material.dart';

class StarsWidget2 extends StatelessWidget {
  const StarsWidget2({super.key, required this.currentStar, required this.mainAxisAlignment});

  final int currentStar;
  final int maxStar = 5;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(
        maxStar,
        (index) => AnimatedOpacity(
          opacity: currentStar >= (index + 1) ? 1 : 0.4,
          duration: const Duration(milliseconds: 500),
          child: const Icon(
            Icons.star_rate_rounded,
            color: Color(0XFFFFBE32),
          ),
        ),
      ),
    );
  }
}
