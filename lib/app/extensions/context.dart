import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
  bool get isMaterial => Theme.of(this).platform == TargetPlatform.android;
  bool get isCupertino => Theme.of(this).platform == TargetPlatform.iOS;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get textScale => MediaQuery.of(this).textScaleFactor;
  double get viewHeight => height - padding.top - padding.bottom;
  double get viewWidth => width - padding.left - padding.right;
  double get viewInsetsBottom => viewInsets.bottom;
  double get viewInsetsTop => viewInsets.top;
  double get viewInsetsLeft => viewInsets.left;

  Color get subtitleColor => const Color(0xFF6F6F87);
  Color get boxColor => const Color(0xFF383344);
  //Colors from theme
}
