import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({super.key, required this.currentStar});

  final int currentStar;
  final int maxStar = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxStar,
        (index) => AnimatedOpacity(
          opacity: currentStar >= (index + 1) ? 1 : 0,
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
