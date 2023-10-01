import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:smart_home_ui/app/extensions/context.dart';
import 'package:smart_home_ui/app/extensions/spacing.dart';
import 'package:smart_home_ui/app/utils.dart';

class CircularSlider extends StatefulWidget {
  const CircularSlider({
    required this.onAngleChanged,
    required this.center,
    super.key,
  });
  final Widget center;
  final ValueChanged<double> onAngleChanged;

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;
  double currentAngle = 0;
  double startAngle = toRadian(0);
  double totalAngle = toRadian(360);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final canvasSize = Size(screenSize.width, screenSize.width - 35);
    final center = canvasSize.center(Offset.zero);
    final draggerPosition = toPolar(
      center - const Offset(9, 9),
      currentAngle + startAngle,
      120,
    );

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('16°'),
            24.hGap,
            CustomPaint(
              painter: SliderPainter(
                context: context,
                currentAngle: currentAngle,
              ),
              child: widget.center,
            ),
            24.hGap,
            const Text('32°'),
          ],
        ),
        Positioned(
          right: draggerPosition.dx,
          top: draggerPosition.dy,
          child: GestureDetector(
            onPanStart: (details) {
              final box = context.findRenderObject()! as RenderBox;
              _currentDragOffset = box.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              final prevOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              final angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(prevOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: const _Dragger(),
          ),
        ),
      ],
    );
  }
}

class _Dragger extends StatelessWidget {
  const _Dragger();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.onBackground,
      ),
    );
  }
}

class SliderPainter extends CustomPainter {
  SliderPainter({required this.context, required this.currentAngle});
  final double currentAngle;
  final BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final rect = Rect.fromCircle(center: center, radius: 120);
    final paint = Paint()
      ..shader = SweepGradient(
        colors: [
          context.colorScheme.error,
          context.colorScheme.primary,
          context.colorScheme.secondary,
          context.colorScheme.error,
        ],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      0,
      -math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
