import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollListenerTest extends StatefulWidget {
  const ScrollListenerTest({super.key});

  @override
  State<ScrollListenerTest> createState() => _ScrollListenerTestState();
}

class _ScrollListenerTestState extends State<ScrollListenerTest>
    with SingleTickerProviderStateMixin {
  // AnimationController? animationController;

  final double _maxTopWidget = 250;
  final double _minTopWidget = 100;

  final Duration _animationDuration = const Duration(milliseconds: 250);
  ScrollController scrollController = ScrollController();

  bool xExpand = true;

  @override
  void initState() {
    // animationController =
    //     AnimationController(vsync: this, duration: _animationDuration);
    scrollController.addListener(
      () {
        if (scrollController.hasClients) {
          if (scrollController.offset >= 25) {
            if (xExpand) {
              setState(() {
                xExpand = false;
                // animationController!.toggle();
              });
            }
          } else {
            if (!xExpand) {
              setState(() {
                xExpand = true;
                // animationController!.toggle();
              });
            }
          }
        }
      },
    );
    // }
    super.initState();
  }

  @override
  void dispose() {
    // animationController?.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: _animationDuration,
                      height: xExpand ? _maxTopWidget : 0,
                    ),
                    Expanded(
                        child: GridView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey,
                          child: const Icon(
                            Icons.abc,
                            size: 50,
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: xExpand ? 0 : 10, sigmaY: xExpand ? 0 : 10),
                        child: AnimatedContainer(
                          duration: _animationDuration,
                          width: MediaQuery.of(context).size.width,
                          height: xExpand ? _maxTopWidget : _minTopWidget,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(xExpand ? 0 : 20))),
                          child: Stack(
                            children: [
                              AnimatedAlign(
                                alignment: xExpand
                                    ? Alignment.topCenter
                                    : Alignment.centerLeft,
                                duration: _animationDuration,
                                child: AnimatedContainer(
                                  duration: _animationDuration,
                                  margin: EdgeInsets.only(
                                      top: xExpand ? (150 + 10) : 0,
                                      left: xExpand ? 0 : (70 + 10 + 20)),
                                  child: Column(
                                    mainAxisAlignment: xExpand
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.center,
                                    crossAxisAlignment: xExpand
                                        ? CrossAxisAlignment.center
                                        : CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Bulbursaur',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          3,
                                          (index) => const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedAlign(
                                alignment: xExpand
                                    ? Alignment.topCenter
                                    : Alignment.centerLeft,
                                duration: _animationDuration,
                                child: AnimatedContainer(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  duration: _animationDuration,
                                  width: xExpand ? 150 : 70,
                                  height: xExpand ? 150 : 70,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
