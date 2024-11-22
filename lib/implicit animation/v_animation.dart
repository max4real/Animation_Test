import 'package:animation_test/implicit%20animation/c_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    ImplicitAnimationController controller =
        Get.put(ImplicitAnimationController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.runSequentialAnimations();
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            //animated containter
            ValueListenableBuilder(
              valueListenable: controller.isBlue,
              builder: (context, isblue, child) {
                return ValueListenableBuilder(
                  valueListenable: controller.isExpanded,
                  builder: (context, isExpanded, child) {
                    return GestureDetector(
                      onTap: () {
                        controller.onchangeAnimatedContainer();
                      },
                      child: Animated_Container(
                        color: isblue,
                        isExpanded: isExpanded,
                        child: const Center(
                          child: Text(
                            'Tap Me',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            //animated opicity
            ValueListenableBuilder(
              valueListenable: controller.isVisiable,
              builder: (context, isVisiable, child) {
                return GestureDetector(
                  onTap: () {
                    controller.onchangeAnimatedOpicity();
                  },
                  child: Animated_Opacity(
                    isVisible: isVisiable,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                    ),
                  ),
                );
              },
            ),
            //animated align
            GestureDetector(
              onTap: () {
                controller.onchangeAnimatedAlign();
              },
              child: Container(
                width: 300,
                height: 300,
                color: Colors.blueGrey,
                child: ValueListenableBuilder(
                  valueListenable: controller.isAlignedRight,
                  builder: (context, isAlignedRight, child) {
                    return Animated_Align(
                      isAlignedRight: isAlignedRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.yellow,
                      ),
                    );
                  },
                ),
              ),
            ),
            //animated position
            GestureDetector(
              onTap: () {
                controller.onchangeAnimatedPositioned();
              },
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.deepPurple,
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller.isPosition,
                    builder: (context, isPosition, child) {
                      return Animated_Align(
                        isAlignedRight: isPosition,
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.yellow,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            //animated padding
            InkWell(
              onTap: () {
                controller.onchangeAnimatedPadding();
              },
              child: ValueListenableBuilder(
                valueListenable: controller.isPadded,
                builder: (context, isPadded, child) {
                  return Animated_Padding(
                    isPadded: isPadded,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
            //animated switcher
            InkWell(
              onTap: () {
                controller.onchangeAnimatedSwitcher();
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: ValueListenableBuilder(
                  valueListenable: controller.isToggled,
                  builder: (context, isToggled, child) {
                    return Animated_Switcher(
                        isToggled: isToggled,
                        child1: Container(
                          width: 50,
                          height: 50,
                          color: Colors.yellow,
                        ),
                        child2: Text("Hello"));
                  },
                ),
              ),
            ),
            //animated cross fade
            InkWell(
              onTap: () {
                controller.onchangeAnimatedCrossFade();
              },
              child: ValueListenableBuilder(
                valueListenable: controller.isFirst,
                builder: (context, isFirst, child) {
                  return Animated_CrossFade(
                    isFirst: isFirst,
                    child1: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    child2: Container(
                      width: 150,
                      height: 150,
                      color: Colors.blue,
                    ),
                  );
                },
              ),
            ),
            //animated Rotation
            InkWell(
              onTap: () {
                controller.onchangeAnimatedRotation();
              },
              child: ValueListenableBuilder(
                valueListenable: controller.isRotated,
                builder: (context, isRotated, child) {
                  return Animated_Rotation(
                    isRotated: isRotated,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
            //animated Scale
            InkWell(
              onTap: () {
                controller.onchangeAnimatedScale();
              },
              child: ValueListenableBuilder(
                valueListenable: controller.isScaledUp,
                builder: (context, isScaledUp, child) {
                  return Animated_Scale(
                    isScaledUp: isScaledUp,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Animated_Container({
    required bool color,
    required bool isExpanded,
    required Widget child,
  }) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: isExpanded ? 200 : 100,
      height: isExpanded ? 200 : 100,
      curve: Curves.elasticIn,
      decoration: BoxDecoration(
        color: color ? Colors.blue : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget Animated_Opacity({
    required bool isVisible,
    required Widget child,
  }) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: child,
    );
  }

  Widget Animated_Align({
    required bool isAlignedRight,
    required Widget child,
  }) {
    return AnimatedAlign(
      alignment: isAlignedRight ? Alignment.topLeft : Alignment.bottomRight,
      duration: Duration(seconds: 1),
      child: child,
    );
  }

  Widget Animated_Positioned({
    required bool isPosition,
    required Widget child,
  }) {
    return AnimatedPositioned(
      top: isPosition ? 50 : 200,
      duration: Duration(seconds: 1),
      child: child,
    );
  }

  Widget Animated_Padding({
    required bool isPadded,
    required Widget child,
  }) {
    return AnimatedPadding(
      padding: EdgeInsets.all(isPadded ? 20 : 0),
      duration: Duration(seconds: 1),
      child: child,
    );
  }

  Widget Animated_Switcher({
    required bool isToggled,
    required Widget child1,
    required Widget child2,
  }) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      child: isToggled ? child1 : child2,
    );
  }

  Widget Animated_CrossFade({
    required bool isFirst,
    required Widget child1,
    required Widget child2,
  }) {
    return AnimatedCrossFade(
      duration: Duration(seconds: 1),
      firstChild: child1,
      secondChild: child2,
      crossFadeState:
          isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget Animated_Rotation({
    required bool isRotated,
    required Widget child,
  }) {
    return AnimatedRotation(
      turns: isRotated ? 0.5 : 0,
      duration: Duration(seconds: 1),
      child: child,
    );
  }

  Widget Animated_Scale({
    required bool isScaledUp,
    required Widget child,
  }) {
    return AnimatedScale(
      scale: isScaledUp ? 1.5 : 1.0,
      duration: Duration(seconds: 1),
      child: child,
    );
  }
}
