import 'dart:ui';

import 'package:flutter/material.dart';

class SctollListnerMe extends StatefulWidget {
  const SctollListnerMe({super.key});

  @override
  State<SctollListnerMe> createState() => _SctollListnerMeState();
}

class _SctollListnerMeState extends State<SctollListnerMe> {
  ScrollController _scrollController = ScrollController();
  final Duration _animationDuration = const Duration(milliseconds: 250);

  final double _maxTopHigh = 250;
  final double _minTopHigh = 100;

  bool xExpand = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.offset >= 25) {
          setState(() {
            xExpand = false;
          });
        } else {
          setState(() {
            xExpand = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: _animationDuration,
                    height: xExpand ? _maxTopHigh : 0,
                    // color: Colors.yellow.withOpacity(0.4),
                  ),
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey,
                          child: const Icon(
                            Icons.abc,
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: xExpand ? 0 : 10,
                    sigmaY: xExpand ? 0 : 10,
                  ),
                  child: AnimatedContainer(
                    duration: _animationDuration,
                    width: MediaQuery.of(context).size.width,
                    height: xExpand ? _maxTopHigh : _minTopHigh,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                          xExpand ? 0 : 20,
                        ),
                      ),
                    ),
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
                            duration: _animationDuration,
                            width: xExpand ? 150 : 60,
                            height: xExpand ? 150 : 60,
                            margin: EdgeInsets.only(
                              left: xExpand ? 0 : 20,
                              top: xExpand ? 10 : 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
