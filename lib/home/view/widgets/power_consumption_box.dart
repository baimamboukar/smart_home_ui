import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:redacted/redacted.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/app/extensions/spacing.dart';

class PowerConsumptionBox extends StatelessWidget {
  const PowerConsumptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 80,
      decoration: BoxDecoration(
        color: context.boxColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
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
              child: const Center(
                child: HeroIcon(
                  HeroIcons.bolt,
                  size: 28,
                  style: HeroIconStyle.solid,
                ),
              ),
            ),
            18.hGap,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '63.2 KWh',
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Electricity usage this month',
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: 10,
                    color: context.subtitleColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Center(
                  child: HeroIcon(
                    HeroIcons.arrowRight,
                    size: 24,
                    style: HeroIconStyle.outline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).redacted(context: context, redact: false);
  }
}
