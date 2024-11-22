import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class OpenContainerWrapper extends StatelessWidget {
  final Widget closedChild;
  final Widget openChild;

  const OpenContainerWrapper({
    super.key,
    required this.closedChild,
    required this.openChild,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OpenContainer(
      openBuilder: (context, closedContainer) {
        return openChild;
      },
      openColor: theme.cardColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      closedElevation: 0,
      closedColor: theme.cardColor,
      closedBuilder: (context, openContainer) {
        return InkWell(
          onTap: () {
            openContainer();
          },
          child: closedChild,
        );
      },
    );
  }
}
