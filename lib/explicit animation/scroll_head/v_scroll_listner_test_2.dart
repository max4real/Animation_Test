import 'dart:math';

import 'package:flutter/material.dart';

class ScrollListenerTest2 extends StatefulWidget {
  const ScrollListenerTest2({super.key});

  @override
  State<ScrollListenerTest2> createState() => _ScrollListenerTest2State();
}

class _ScrollListenerTest2State extends State<ScrollListenerTest2>
    with SingleTickerProviderStateMixin {
  final double _itemHeight = 100;
  ScrollController scrollController = ScrollController();

  ValueNotifier<double> position = ValueNotifier(100);
  Duration animationDuration = Duration.zero;
  double currentPastOffset = 0;
  double pastOffset = 0;
  bool xExpand = true;

  @override
  void initState() {
    // scrollController.addListener(() {
    //   if (scrollController.hasClients) {
    //     if (pastOffset - scrollController.offset < 0) {
    //       setState(() {
    //         xGoingHigh = false;
    //       });
    //     } else {
    //       setState(() {
    //         xGoingHigh = true;
    //       });
    //     }

    //     pastOffset = scrollController.offset;
    //   }
    // });
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        animationDuration = Duration.zero;
        if (currentPastOffset - scrollController.offset < 0) {
          print('low');

          double temp = double.parse(position.value.toString());
          position.value = max(
              (temp - (currentPastOffset - scrollController.offset).abs()), 0);
        } else {
          print('high');
          double temp = double.parse(position.value.toString());
          position.value = min(
              (temp + (currentPastOffset - scrollController.offset).abs()),
              _itemHeight);
        }

        currentPastOffset = scrollController.offset;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: position,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return AnimatedContainer(
                          duration: animationDuration,
                          height: max(0, (value)),
                        );
                      },
                    ),
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollEndNotification) {
                            if (position.value >= 0) {
                              animationDuration = Duration(milliseconds: 250);
                              if (position.value < 50) {
                                position.value = 0;
                              } else {
                                position.value = _itemHeight;
                              }
                            }
                          }
                          return true;
                        },
                        child: GridView.builder(
                          itemCount: 20,
                          controller: scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey,
                              child: Text(
                                '$index',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: position,
                builder: (BuildContext context, double value, Widget? child) {
                  return AnimatedPositioned(
                      duration: animationDuration,
                      top: value - _itemHeight,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: _itemHeight,
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: const Text(
                          'Hello world',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
