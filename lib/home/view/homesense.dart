import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/app/extensions/spacing.dart';
import 'package:smart_home_ui/home/data/models/device.dart';
import 'package:smart_home_ui/home/view/widgets/slider.dart';

class Homesense extends StatelessWidget {
  const Homesense({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              34.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeroIcon(
                    HeroIcons.squares2x2,
                    color: context.colorScheme.onBackground,
                    style: HeroIconStyle.outline,
                  ),
                  CircleAvatar(
                    backgroundColor: context.colorScheme.primary,
                    radius: 18,
                    child: const CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80',
                      ),
                    ),
                  ),
                ],
              ),
              24.vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Baimam 👋',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome back to home',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          color: context.subtitleColor,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF363441),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.5),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Add Device'),
                              4.hGap,
                              const HeroIcon(
                                HeroIcons.plusCircle,
                                size: 18,
                                style: HeroIconStyle.outline,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              34.vGap,
              Container(
                width: context.width,
                height: 80,
                decoration: BoxDecoration(
                  color: context.boxColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
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
              ),
              24.vGap,
              Row(
                children: [
                  Text(
                    'Linked to you',
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    label: HeroIcon(
                      HeroIcons.arrowSmallRight,
                      style: HeroIconStyle.outline,
                      color: context.subtitleColor,
                      size: 14,
                    ),
                    onPressed: () {},
                    icon: Text(
                      'See all',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        color: context.subtitleColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
                width: 120,
                child: CircularSlider(
                  minValue: 500,
                  maxValue: 800,
                  child: Center(child: Text('x')),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: devices.length,
                itemBuilder: (BuildContext context, int index) {
                  return DeviceBox(
                    device: devices[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceBox extends StatelessWidget {
  const DeviceBox({
    required this.device,
    super.key,
  });
  final Device device;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: !device.isActive ? context.boxColor : null,
        gradient: device.isActive
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.colorScheme.primary,
                  context.colorScheme.secondary,
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: device.isActive
                        ? context.colorScheme.onBackground
                        : context.colorScheme.background,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                      child: Visibility(
                        visible: device.icon.isHero,
                        replacement: Icon(
                          device.icon.material,
                          size: 28,
                          color: !device.isActive
                              ? context.colorScheme.onBackground
                              : context.colorScheme.background,
                        ),
                        child: HeroIcon(
                          device.icon.isHero
                              ? device.icon.hero!
                              : HeroIcons.variable,
                          size: 28,
                          color: !device.isActive
                              ? context.colorScheme.onBackground
                              : context.colorScheme.background,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          device.state.value,
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (device.state.hasIndicator)
                          Transform.translate(
                            offset: const Offset(0, -7.5),
                            child: Text(
                              device.state.indicator,
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (!device.state.hasIndicator)
                      Text(
                        device.state.label,
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: 11,
                          color: context.subtitleColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              device.space,
              style: context.textTheme.bodyLarge!.copyWith(
                fontSize: 10,
                color: context.subtitleColor,
              ),
            ),
            Text(
              device.name,
              style: context.textTheme.bodyLarge!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: device.isActive
                    ? context.colorScheme.background
                    : context.colorScheme.onBackground,
              ),
            ),
            Switch.adaptive(
              value: device.isActive,
              applyCupertinoTheme: true,
              activeColor: context.colorScheme.onBackground,
              activeTrackColor: context.colorScheme.background,
              inactiveTrackColor: Colors.transparent,
              inactiveThumbColor: context.colorScheme.onBackground,
              onChanged: (state) => device.isActive = state,
            ),
          ],
        ),
      ),
    );
  }
}
