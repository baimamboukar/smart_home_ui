import 'package:go_router/go_router.dart';
import 'package:smart_home_ui/home/view/air_conditionner.dart';
import 'package:smart_home_ui/home/view/homesense.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Homesense(),
    ),
    GoRoute(
      path: '/air-conditionner',
      name: 'air-conditionner',
      builder: (context, state) => const AirConditionner(),
    ),
  ],
);
