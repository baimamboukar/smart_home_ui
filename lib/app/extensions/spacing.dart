import 'package:flutter/widgets.dart';

extension SpacingX on num {
  SizedBox get vGap => SizedBox(height: toDouble());
  SizedBox get hGap => SizedBox(width: toDouble());
}
