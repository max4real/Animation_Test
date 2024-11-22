import 'dart:async';

import 'package:animation_test/explicit%20animation/carousel/hero_model.dart';
import 'package:animation_test/explicit%20animation/carousel/w_progress_bar.dart';
import 'package:animation_test/explicit%20animation/carousel/w_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => CarouselPageState();
}

class CarouselPageState extends State<CarouselPage> {
  List<HeroModel> heroList = [];
  String _animatedText = '';
  int _currentPageIndex = 0;
  bool on = false;
  Timer textTimer = Timer(Duration.zero, () {});
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.4,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    animateText(heroList[_currentPageIndex].description);
  }

  @override
  void dispose() {
    _pageController.dispose();
    textTimer.cancel();
    super.dispose();
  }

  void getData() {
    final List<HeroModel> temp = [
      HeroModel(
        name: "Bubursaur",
        image: 'assets/63c4cf697ad9d1e9c93aeab8b3560592.png',
        rating: 1,
        description:
            "Bulbasaur is a small, quadrupedal Pokémon that resembles a dinosaur with a plant bulb on its back.",
        atkPercentage: 60,
        hpPercentage: 70,
        defPercentage: 40,
      ),
      HeroModel(
        name: "Charzard",
        image: 'assets/07066d706a4136eb22c19a3d609d32ef.png',
        rating: 3,
        description:
            "Charizard is a draconic, bipedal Pokémon with orange skin and blue-green wing membranes.",
        atkPercentage: 80,
        hpPercentage: 65,
        defPercentage: 55,
      ),
      HeroModel(
        name: "Squirtle",
        image: 'assets/d02b1bab0b0edc1e86853ab6aacd9a60.png',
        rating: 2,
        description:
            "Squirtle is a small, light-blue Pokémon with an appearance similar to a turtle.",
        atkPercentage: 50,
        hpPercentage: 75,
        defPercentage: 60,
      ),
    ];

    heroList = temp;
  }

  void animateText(String fullText) async {
    print(fullText);
    _animatedText = '';
    List<String> words = fullText.split('');
    if (textTimer.isActive) textTimer.cancel();
    textTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (words.length == timer.tick) {
        timer.cancel();
      }
      setState(() {
        _animatedText += (words[timer.tick - 1]);
      });
    });
    // for (String word in words) {
    //   await Future.delayed(const Duration(milliseconds: 100));
    //   setState(() {
    //     _animatedText += ('$word ');
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 4,
                    offset: const Offset(4, 4),
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Get.width,
                      child: Stack(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: ClipRRect(
                              key: ValueKey(heroList[_currentPageIndex].image),
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                heroList[_currentPageIndex].image,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      on = !on;
                                    });
                                  },
                                  icon: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    transitionBuilder: (child, animation) {
                                      return ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    child: Icon(
                                      on
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      key: ValueKey(on),
                                      color: on ? Colors.red : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                heroList[_currentPageIndex].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              StarsWidget(
                                currentStar: heroList[_currentPageIndex].rating,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _animatedText,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ProgressBarWidget(
                            key: ValueKey('${_currentPageIndex}_atk'),
                            percentage:
                                heroList[_currentPageIndex].atkPercentage,
                            name: "Atk",
                            color: const Color(0XFFD64C4C),
                          ),
                          const SizedBox(height: 8),
                          ProgressBarWidget(
                            key: ValueKey('${_currentPageIndex}_hp'),
                            percentage:
                                heroList[_currentPageIndex].hpPercentage,
                            name: "Hp",
                            color: const Color(0XFF82D73C),
                          ),
                          const SizedBox(height: 8),
                          ProgressBarWidget(
                            key: ValueKey('${_currentPageIndex}_def'),
                            percentage:
                                heroList[_currentPageIndex].defPercentage,
                            name: "Def",
                            color: const Color(0XFF4689DB),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 160,
            child: PageView.builder(
              controller: _pageController,
              itemCount: heroList.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPageIndex = page;
                });
                animateText(heroList[page].description);
              },
              itemBuilder: (context, index) {
                final hero = heroList[index];
                return GestureDetector(
                  onTap: () {
                    _currentPageIndex = index;
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  child: AnimatedScale(
                    scale: index == _currentPageIndex ? 1.0 : 0.8,
                    duration: const Duration(milliseconds: 200),
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          hero.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
