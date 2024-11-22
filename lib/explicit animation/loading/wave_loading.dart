import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaveLoading extends StatefulWidget {
  const WaveLoading({super.key});

  @override
  State<WaveLoading> createState() => _WaveLoadingState();
}

class _WaveLoadingState extends State<WaveLoading> {
  final List<ValueNotifier<Offset>> _ballOffsets = [];
  late final Timer _timer;

  final double _ballSize = 15;
  final List<double> _amplitudes = [
    3,
    3,
    3
  ]; // Max bounce heights for each ball
  final List<double> _frequencies = [8, 8, 8]; // Bounce speeds for each ball
  final List<double> _phases = [0, pi / 2, pi]; // Phase shifts for each ball
  final List<double> _time = [0, 0, 0]; // Time trackers for each ball

  @override
  void initState() {
    super.initState();
    // Initialize ball positions
    for (int i = 0; i < 3; i++) {
      _ballOffsets.add(
        ValueNotifier(
          Offset(
            // Get.width /2 + 5, // Spread balls horizontally
            Get.width / 2 +
                (i - 1) * _ballSize * 1.7, // Spread balls horizontally
            Get.height / 2,
          ),
        ),
      );
    }
    _startBouncing();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var offset in _ballOffsets) {
      offset.dispose();
    }
    super.dispose();
  }

  void _startBouncing() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 16), // ~60 FPS
      (_) {
        for (int i = 0; i < _ballOffsets.length; i++) {
          _time[i] += 0.016; // Increment time for each ball
          double newY = Get.height / 2 -
              _amplitudes[i] *
                  sin(_frequencies[i] * _time[i] + _phases[i]); // Phase shift
          _ballOffsets[i].value = Offset(
            _ballOffsets[i].value.dx, // Keep horizontal position constant
            newY,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _ballOffsets.map((offset) {
          return ValueListenableBuilder<Offset>(
            valueListenable: offset,
            builder: (context, offset, child) {
              return Positioned(
                left: offset.dx - _ballSize / 2, // Center the ball horizontally
                top: offset.dy - _ballSize / 2, // Center the ball vertically
                child: Container(
                  width: _ballSize,
                  height: _ballSize,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(_ballSize / 2),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BounceLoading extends StatefulWidget {
//   const BounceLoading({super.key});

//   @override
//   State<BounceLoading> createState() => _BounceLoadingState();
// }

// class _BounceLoadingState extends State<BounceLoading> {
//   late Timer _timer;
//   final double _ballSize = 15;
//   final double _centerX = Get.width / 2;
//   final double _centerY = Get.height / 2;

//   final List<double> _phases = [0, pi / 2, pi]; // Phase shifts for each ball
//   final List<ValueNotifier<Offset>> _ballOffsets = List.generate(
//     3,
//     (i) => ValueNotifier(
//       Offset(Get.width / 2 + (i - 1) * 25, Get.height / 2), // Initial positions
//     ),
//   );

//   @override
//   void initState() {
//     super.initState();
//     // _startBouncing();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     for (var offset in _ballOffsets) {
//       offset.dispose();
//     }
//     super.dispose();
//   }

//   void _startBouncing() {
//     double time = 0;
//     _timer = Timer.periodic(
//       const Duration(milliseconds: 16), // ~60 FPS
//       (_) {
//         time += 0.016; // Increment time
//         for (int i = 0; i < _ballOffsets.length; i++) {
//           double newY =
//               _centerY - 30 * sin(8 * time + _phases[i]); // Bounce formula
//           _ballOffsets[i].value = Offset(_ballOffsets[i].value.dx, newY);
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: _ballOffsets.map((offset) {
//           return ValueListenableBuilder<Offset>(
//             valueListenable: offset,
//             builder: (context, offset, child) {
//               return Positioned(
//                 left: offset.dx - _ballSize / 2,
//                 top: offset.dy - _ballSize / 2,
//                 child: Container(
//                   width: _ballSize,
//                   height: _ballSize,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(_ballSize / 2),
//                   ),
//                 ),
//               );
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
