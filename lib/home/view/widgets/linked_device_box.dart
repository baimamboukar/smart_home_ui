import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/home/data/models/device.dart';

class DeviceBox extends StatelessWidget {
  const DeviceBox({
    required this.device,
    super.key,
  });
  final Device device;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed('air-conditionner'),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
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
      ),
    );
  }
}
