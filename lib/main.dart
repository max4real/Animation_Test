import 'package:animation_test/explicit%20animation/carousel/carousel.dart';
import 'package:animation_test/explicit%20animation/digit_animation/digit_animation.dart';
import 'package:animation_test/explicit%20animation/dvd/dvd.dart';
import 'package:animation_test/explicit%20animation/onboarding/onboarding.dart';
import 'package:animation_test/explicit%20animation/scroll_head/v_scroll_head.dart';
import 'package:animation_test/explicit%20animation/scroll_head/v_scroll_listener_test.dart';
import 'package:animation_test/explicit%20animation/scroll_head/v_scroll_listner_test_2.dart';
import 'package:animation_test/explicit%20animation/test.dart';
import 'package:animation_test/open_container_animation.dart';
import 'package:animation_test/implicit%20animation/v_animation.dart';
import 'package:animation_test/explicit%20animation/loading/_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const HomePage(),
      // home: const AnimationPage(),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const OpenContainerAnimation(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Goto Open Container Animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const AnimationPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Goto Implicit Animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const LoadingPages(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Goto Loading Animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const DVDPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Goto DVD Animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => TestPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Test',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => CarouselPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Carousel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => OnboardingPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 100),
                );
              },
              child: const Text(
                'OnBoardingPage',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const DigitAnimation(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text(
                'Digit Animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const ScrollHeadPage(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 100),
                );
              },
              child: const Text(
                'Scroll Head',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const ScrollListenerTest(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 100),
                );
              },
              child: const Text(
                'ScrollListenerTest(Kame)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const ScrollListenerTest2(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 100),
                );
              },
              child: const Text(
                'ScrollListenerTest2(Kame)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
