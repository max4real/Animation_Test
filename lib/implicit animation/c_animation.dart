import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImplicitAnimationController extends GetxController {
  ValueNotifier<bool> isExpanded = ValueNotifier(false);
  ValueNotifier<bool> isBlue = ValueNotifier(false);

  ValueNotifier<bool> isVisiable = ValueNotifier(false);

  ValueNotifier<bool> isAlignedRight = ValueNotifier(false);

  ValueNotifier<bool> isPosition = ValueNotifier(false);

  ValueNotifier<bool> isPadded = ValueNotifier(false);

  ValueNotifier<bool> isToggled = ValueNotifier(false);

  ValueNotifier<bool> isFirst = ValueNotifier(false);

  ValueNotifier<bool> isRotated = ValueNotifier(false);

  ValueNotifier<bool> isScaledUp = ValueNotifier(false);

  void onchangeAnimatedContainer() {
    isBlue.value = !isBlue.value;
    isExpanded.value = !isExpanded.value;
  }

  void onchangeAnimatedOpicity() {
    isVisiable.value = !isVisiable.value;
  }

  void onchangeAnimatedAlign() {
    isAlignedRight.value = !isAlignedRight.value;
  }

  void onchangeAnimatedPositioned() {
    isPosition.value = !isPosition.value;
  }

  void onchangeAnimatedPadding() {
    isPadded.value = !isPadded.value;
  }

  void onchangeAnimatedSwitcher() {
    isToggled.value = !isToggled.value;
  }

  void onchangeAnimatedCrossFade() {
    isFirst.value = !isFirst.value;
  }

  void onchangeAnimatedRotation() {
    isRotated.value = !isRotated.value;
  }

  void onchangeAnimatedScale() {
    isScaledUp.value = !isScaledUp.value;
  }

  void runSequentialAnimations() async {
    final animationFunctions = [
      onchangeAnimatedContainer,
      onchangeAnimatedOpicity,
      onchangeAnimatedAlign,
      onchangeAnimatedPositioned,
      onchangeAnimatedPadding,
      onchangeAnimatedSwitcher,
      onchangeAnimatedCrossFade,
      onchangeAnimatedRotation,
      onchangeAnimatedScale,
    ];

    for (var i = 0; i < 5; i++) {
      for (var animation in animationFunctions) {
        // Toggle each animation with a delay between them
        animation();
        await Future.delayed(
            Duration(milliseconds: 500)); // Adjust the delay as needed
      }
    }
  }
}
