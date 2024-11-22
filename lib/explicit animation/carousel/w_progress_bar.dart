import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({
    super.key,
    required this.percentage,
    required this.name,
    required this.color,
  });

  final double percentage;
  final String name;
  final Color color;

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  double _animatedPercentage = 0;

  @override
  void initState() {
    super.initState();
    // _animatedPercentage = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animatedPercentage = widget.percentage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: Get.width,
          height: 7,
          decoration: BoxDecoration(
            color: const Color(0XFFECECEC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                width: Get.width * (_animatedPercentage / 100),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
