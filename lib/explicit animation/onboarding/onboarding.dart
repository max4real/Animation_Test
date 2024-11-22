import 'package:animation_test/explicit%20animation/onboarding/w_custom_button.dart';
import 'package:animation_test/explicit%20animation/onboarding/w_description.dart';
import 'package:animation_test/explicit%20animation/onboarding/w_image.dart';
import 'package:animation_test/explicit%20animation/onboarding/w_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  final double _dotSize = 10;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "image": "assets/d02b1bab0b0edc1e86853ab6aacd9a60.png",
      "title": "Set Your Bus Alarm",
      "description":
          "Choose your destination and set an alarm to notify you when your stop is approaching. Never worry about missing your stop again!",
    },
    {
      "image": "assets/07066d706a4136eb22c19a3d609d32ef.png",
      "title": "Explore Bus Routes",
      "description":
          "Easily browse through available bus routes and stops. Find your way around the city and plan your journey with ease",
    },
    {
      "image": "assets/63c4cf697ad9d1e9c93aeab8b3560592.png",
      "title": "Title",
      "description":
          "Hello how are you my name is blah blah blah blah blah blah",
    },
    {
      "image": "assets/d02b1bab0b0edc1e86853ab6aacd9a60.png",
      "title": "Set Your Bus Alarm",
      "description":
          "Choose your destination and set an alarm to notify you when your stop is approaching. Never worry about missing your stop again!",
    },
    {
      "image": "assets/07066d706a4136eb22c19a3d609d32ef.png",
      "title": "Explore Bus Routes",
      "description":
          "Easily browse through available bus routes and stops. Find your way around the city and plan your journey with ease",
    },
    {
      "image": "assets/63c4cf697ad9d1e9c93aeab8b3560592.png",
      "title": "Title",
      "description":
          "Hello how are you my name is blah blah blah blah blah blah",
    },
  ];

  void _nextPage() {
    setState(() {
      _currentIndex++;
    });
  }

  void _previousPage() {
    setState(() {
      _currentIndex--;
    });
  }

  void _movePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentData = _onboardingData[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              width: Get.width,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageWidget(
                    imageKey: ValueKey(currentData["image"]),
                    image: currentData["image"]!,
                  ),
                  const SizedBox(height: 30),
                  TitleWidget(
                    titleKey: ValueKey(currentData["title"]),
                    title: currentData["title"]!,
                  ),
                  const SizedBox(height: 20),
                  DescriptionWidget(
                    descriptionKey: ValueKey(currentData["description"]),
                    description: currentData["description"]!,
                  ),
                  const SizedBox(height: 30),
                  if (_currentIndex == _onboardingData.length - 1)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFF2F7EF0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 100),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CustomButton(
                onPressed: () {
                  if (_currentIndex > 0) {
                    _previousPage();
                  }
                },
                icon: Icons.arrow_back,
                offset: _currentIndex > 0 ? Offset.zero : const Offset(-0.5, 0),
                opacity: _currentIndex > 0 ? 1.0 : 0.0,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  if (_currentIndex != _onboardingData.length - 1) {
                    _nextPage();
                  }
                },
                icon: Icons.arrow_forward,
                offset: _currentIndex != _onboardingData.length - 1
                    ? Offset.zero
                    : const Offset(0.5, 0),
                opacity:
                    _currentIndex != _onboardingData.length - 1 ? 1.0 : 0.0,
              ),
            ],
          ),
          // custon indicator 1
          // Positioned(
          //   bottom: 80,
          //   left: 0,
          //   right: 0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       _onboardingData.length,
          //       (index) => AnimatedContainer(
          //         duration: const Duration(milliseconds: 300),
          //         margin: const EdgeInsets.symmetric(horizontal: 4),
          //         width: _currentIndex == index ? 20 : 8,
          //         height: 8,
          //         decoration: BoxDecoration(
          //           color: _currentIndex == index
          //               ? Colors.blue
          //               : Colors.grey.withOpacity(0.5),
          //           borderRadius: BorderRadius.circular(4),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // custon indicator 2
          const SizedBox(height: 20),
          SizedBox(
            width: _dotSize * _onboardingData.length * 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          _movePage(index);
                        },
                        child: Container(
                          width: _dotSize,
                          height: _dotSize,
                          margin:
                              EdgeInsets.symmetric(horizontal: _dotSize / 2),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: (_currentIndex * _dotSize * 2),
                  child: Container(
                    width: _dotSize * 2,
                    height: _dotSize,
                    decoration: BoxDecoration(
                      color: const Color(0XFF2F7EF0),
                      borderRadius: BorderRadius.circular(_dotSize / 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
