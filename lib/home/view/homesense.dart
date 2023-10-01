import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/app/extensions/spacing.dart';
import 'package:smart_home_ui/home/data/models/device.dart';
import 'package:smart_home_ui/home/view/widgets/linked_device_box.dart';
import 'package:smart_home_ui/home/view/widgets/power_consumption_box.dart';

class Homesense extends StatelessWidget {
  const Homesense({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              34.vGap,
              const _AppBar(),
              24.vGap,
              const _WelcomeTile(),
              34.vGap,
              const PowerConsumptionBox(),
              24.vGap,
              const _LinkedToYou(),
              const _LinkedDevices(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeTile extends StatelessWidget {
  const _WelcomeTile();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Rousey 👋',
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
        const _AddDeviceAction(),
      ],
    );
  }
}

class _LinkedToYou extends StatelessWidget {
  const _LinkedToYou();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _LinkedDevices extends StatelessWidget {
  const _LinkedDevices();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemCount: devices.length,
      itemBuilder: (BuildContext context, int index) {
        return Hero(
          tag: '$index-air-conditionner',
          child: DeviceBox(
            device: devices[index],
          ),
        );
      },
    );
  }
}

class _AddDeviceAction extends StatelessWidget {
  const _AddDeviceAction();

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
