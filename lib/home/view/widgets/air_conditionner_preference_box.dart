import 'package:flutter/material.dart';
import 'package:smart_home_ui/app/extensions/context.dart';

class _PeferencesSwitcher extends ValueNotifier<int> {
  _PeferencesSwitcher() : super(1);
}

final selectedIndex = _PeferencesSwitcher();

class AirConditionnerPreferenceBox extends StatelessWidget {
  const AirConditionnerPreferenceBox({
    required this.icon,
    required this.preference, // ignore: unused_element
    required this.index,
    super.key,
  });
  final IconData icon;
  final int index;
  final String preference;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, activeIndex, _) {
        return GestureDetector(
          onTap: () => selectedIndex.value = index,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 114,
            width: 94,
            decoration: BoxDecoration(
              gradient: index == selectedIndex.value
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.colorScheme.primary,
                        context.colorScheme.secondary,
                      ],
                    )
                  : null,
              color: !(index == selectedIndex.value) ? context.boxColor : null,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: !(index == selectedIndex.value)
                          ? context.colorScheme.background
                          : context.colorScheme.onBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        size: 28,
                        color: !(index == selectedIndex.value)
                            ? context.colorScheme.onBackground
                            : context.colorScheme.background,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    preference,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      color: !(index == selectedIndex.value)
                          ? context.colorScheme.onBackground
                          : context.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
