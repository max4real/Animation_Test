import 'dart:ui';

import 'package:animation_test/explicit%20animation/scroll_head/w_stars.dart';
import 'package:flutter/material.dart';

class ScrollHeadPage extends StatefulWidget {
  const ScrollHeadPage({super.key});

  @override
  State<ScrollHeadPage> createState() => _ScrollHeadPageState();
}

class _ScrollHeadPageState extends State<ScrollHeadPage> {
  final ScrollController _controller = ScrollController();

  // Heights and sizes
  double _headHeight = 250;
  double _gridHeight = 250;
  double _imageSize = 160;
  bool _isRowLayout = false;

  final List<Map<String, dynamic>> _dataList = [
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
    {
      "image": "assets/d02b1bab0b0edc1e86853ab6aacd9a60.png",
      "title": "Set Your Bus Alarm",
      "description":
          "Choose your destination and set an alarm to notify you when your stop is approaching. Never worry about missing your stop again!",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _controller.offset;
    if (offset > 40 && _headHeight > 120) {
      setState(() {
        _isRowLayout = true;
        _headHeight = 100;
        _gridHeight = 0;
        _imageSize = 70;
      });
    } else if (offset <= 20 && _headHeight < 250) {
      setState(() {
        _isRowLayout = false;
        _headHeight = 250;
        _gridHeight = 250;
        _imageSize = 160;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Grid View
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 300),
              tween: Tween<double>(begin: 250, end: _gridHeight),
              builder: (context, topMargin, child) {
                return Container(
                  margin: EdgeInsets.only(top: topMargin),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GridView.builder(
                    controller: _controller,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _dataList.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          _dataList[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            // Animated Header
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isRowLayout ? _rowLayout() : _columLayout(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _columLayout() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: _headHeight,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          key: const ValueKey("columnLayout"),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circularImage(_dataList[2]["image"]),
            const SizedBox(height: 10),
            Text(
              _dataList[2]["title"],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const StarsWidget2(
              currentStar: 4,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowLayout() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: _headHeight,
      child: Stack(
        children: [
          // Blur Effect
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          // Content
          Row(
            key: const ValueKey("rowLayout"),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30),
              circularImage(_dataList[2]["image"]),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _dataList[2]["title"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const StarsWidget2(
                      currentStar: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget circularImage(String image) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(
        begin: _isRowLayout ? 160 : 70,
        end: _imageSize,
      ),
      builder: (context, size, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: Image.asset(
            image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
