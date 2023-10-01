import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/app/extensions/spacing.dart';
import 'package:smart_home_ui/home/view/widgets/slider.dart';

class AirConditionner extends StatefulWidget {
  const AirConditionner({super.key});

  @override
  State<AirConditionner> createState() => _AirConditionnerState();
}

class _AirConditionnerState extends State<AirConditionner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
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
          child: const HeroIcon(
            HeroIcons.power,
            size: 28,
            style: HeroIconStyle.solid,
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const HeroIcon(HeroIcons.arrowLeft),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const HeroIcon(HeroIcons.cog6Tooth),
          ),
        ],
        backgroundColor: Colors.transparent,
        title: Text(
          'Air Conditionner',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Text(
                'Working Space',
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.subtitleColor,
                  fontSize: 14,
                ),
              ),
              label: HeroIcon(
                HeroIcons.chevronDown,
                color: context.subtitleColor,
                size: 12,
              ),
            ),
            SizedBox(
              height: 320,
              child: Hero(
                tag: '0-air-conditionner',
                child: CircularSlider(
                  onAngleChanged: (angle) {},
                  center: Center(
                    child: Container(
                      width: 184,
                      height: 184,
                      decoration: BoxDecoration(
                        color: context.boxColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color:
                                context.colorScheme.primary.withOpacity(0.15),
                            offset: const Offset(0, -1),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          4.vGap,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '24',
                                style:
                                    context.textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -14.5),
                                child: Text(
                                  '°C',
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          14.vGap,
                          const Text(
                            'Room \n Temperature',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            24.vGap,
            Text(
              'Mode',
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.subtitleColor,
                fontSize: 14,
              ),
            ),
            Text(
              'POWER FULL',
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            14.vGap,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AirConditionnerPreferenceBox(
                  icon: Icons.air,
                  selected: true,
                  preference: 'COLD',
                ),
                _AirConditionnerPreferenceBox(
                  icon: Icons.water,
                  preference: 'FAN',
                ),
                _AirConditionnerPreferenceBox(
                  icon: Icons.water_drop_outlined,
                  preference: 'DRY',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AirConditionnerPreferenceBox extends StatelessWidget {
  const _AirConditionnerPreferenceBox({
    required this.icon,
    required this.preference,
    // ignore: unused_element
    this.selected = false,
  });
  final IconData icon;
  final bool selected;
  final String preference;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      width: 94,
      decoration: BoxDecoration(
        gradient: selected
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.colorScheme.primary,
                  context.colorScheme.secondary,
                ],
              )
            : null,
        color: !selected ? context.boxColor : null,
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
                color: !selected
                    ? context.colorScheme.background
                    : context.colorScheme.onBackground,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 28,
                  color: !selected
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
                color: !selected
                    ? context.colorScheme.onBackground
                    : context.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
