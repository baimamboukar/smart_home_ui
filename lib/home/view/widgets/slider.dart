import 'dart:math';

import 'package:flutter/material.dart';

class CircularSlider extends StatefulWidget {
  const CircularSlider({
    required this.minValue,
    required this.maxValue,
    required this.child,
    super.key,
  });
  final double minValue;
  final double maxValue;
  final Widget child;

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        final renderBox = context.findRenderObject()! as RenderBox;
        final position = renderBox.globalToLocal(details.globalPosition);
        final angle = atan2(position.dy, position.dx);
        final mappedValue =
            (angle + pi) / (2 * pi) * (widget.maxValue - widget.minValue) +
                widget.minValue;
        setState(() {
          _value = mappedValue;
        });
      },
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 16),
              ),
            ),
            Transform.rotate(
              angle: -pi / 2,
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  strokeWidth: 16,
                  value: (_value - widget.minValue) /
                      (widget.maxValue - widget.minValue),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}
