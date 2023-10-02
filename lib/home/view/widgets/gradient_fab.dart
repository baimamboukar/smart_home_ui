import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home_ui/app/extensions/context.dart';

class GradientFAB extends StatelessWidget {
  const GradientFAB({
    required this.icon,
    super.key,
  });
  final HeroIcons icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.secondary,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: HeroIcon(
        icon,
        size: 28,
        style: HeroIconStyle.solid,
      ),
    );
  }
}
