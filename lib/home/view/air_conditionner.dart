import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/app/extensions/spacing.dart';
import 'package:smart_home_ui/home/view/widgets/air_conditionner_preference_box.dart';
import 'package:smart_home_ui/home/view/widgets/gradient_fab.dart';
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
        onTap: () async {
          await showPlatformDialog<void>(
            context: context,
            builder: (context) => const _TurnOffDialog(),
          );
        },
        child: const GradientFAB(icon: HeroIcons.power),
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
              child: CircularSlider(
                onAngleChanged: (angle) => sliderAngle.value = angle,
                center: const _InnerSliderBox(),
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
                AirConditionnerPreferenceBox(
                  icon: Icons.air,
                  index: 0,
                  preference: 'COLD',
                ),
                AirConditionnerPreferenceBox(
                  icon: Icons.water,
                  preference: 'FAN',
                  index: 1,
                ),
                AirConditionnerPreferenceBox(
                  icon: Icons.water_drop_outlined,
                  preference: 'DRY',
                  index: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliderAngleWatcher extends ValueNotifier<double> {
  SliderAngleWatcher() : super(0);
}

final sliderAngle = SliderAngleWatcher();

class _InnerSliderBox extends StatelessWidget {
  const _InnerSliderBox();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 184,
        height: 184,
        decoration: BoxDecoration(
          color: context.boxColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withOpacity(0.15),
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
                ValueListenableBuilder(
                  valueListenable: sliderAngle,
                  builder: (context, value, child) {
                    return Text(
                      //'${value.toInt()}',
                      '22',
                      style: context.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                      ),
                    );
                  },
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
    );
  }
}

class _TurnOffDialog extends StatelessWidget {
  const _TurnOffDialog();

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      content: const Text(
        'Are you sure you want to turn off the air conditionner?',
      ),
      actions: [
        PlatformDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.error,
            ),
          ),
        ),
        PlatformDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Turn off',
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
