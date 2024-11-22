import 'package:animation_test/max%20block/FadeThroughTransition.dart';
import 'package:animation_test/max%20block/OpenContainer.dart';
import 'package:flutter/material.dart';

class OpenContainerAnimation extends StatelessWidget {
  const OpenContainerAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animatioin'),
        actions: [
          IconButton(
            onPressed: () {
              const FadeThroughTransitionPageWrapper(
                mailbox: DetailsPage(num: 1),
                transitionKey: ValueKey(1),
              );
            },
            icon: const Icon(Icons.arrow_circle_right_rounded),
          )
        ],
      ),
      floatingActionButton: const OpenContainerWrapper(
        closedChild: Icon(
          Icons.add,
          size: 40,
        ),
        openChild: DetailsPage(
          num: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return OpenContainerWrapper(
              closedChild: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Text(index.toString()),
                  ),
                ),
              ),
              openChild: DetailsPage(
                num: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final int num;
  const DetailsPage({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(num.toString()),
      ),
    );
  }
}
