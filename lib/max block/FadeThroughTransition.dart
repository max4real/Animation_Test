import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughTransitionPageWrapper extends Page {
  const FadeThroughTransitionPageWrapper({
    required this.mailbox,
    required this.transitionKey,
  }) : super(key: transitionKey);

  final Widget mailbox;
  final ValueKey transitionKey;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return mailbox;
      },
    );
  }
}
// FadeThroughTransitionPageWrapper(
//               mailbox: InboxPage(destination: currentlySelectedInbox),
//               transitionKey: ValueKey(currentlySelectedInbox),
//             ),