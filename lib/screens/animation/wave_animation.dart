import 'package:flutter/material.dart';

import 'dart:math';

class WavePainter extends CustomPainter {
  final double animationValue; // Animation value to control the wave height

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = Color.fromARGB(90, 74, 147, 206) // Green color for the wave
      ..style = PaintingStyle.fill; // Filling the wave

    final pathGreen = Path();
    pathGreen.moveTo(0, size.height);
    pathGreen.lineTo(0, size.height * 0.3); // Starting point for the wave

    for (var i = 0; i < size.width; i++) {
      final x = i.toDouble();
      final y = size.height * 0.9 +
          animationValue *
              20 *
              sin((i / size.width) * 1.3 * pi); // Calculate wave shape
      pathGreen.lineTo(x, y); // Define wave path
    }

    pathGreen.lineTo(size.width, size.height); // Complete the wave path
    pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen); // Draw the green wave
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the wave continuously
  }
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Synchronize animation with this widget
      duration: Duration(seconds: 2), // Animation duration
    )..repeat(reverse: true); // Repeat the animation back and forth
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context)
                  .size
                  .height), // Set the size of the custom paint
          painter: WavePainter(
              _controller.value), // Use the WavePainter to paint the wave
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}

class WavePainterDark extends CustomPainter {
  final double animationValue; // Animation value to control the wave height

  WavePainterDark(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = Color.fromARGB(90, 0, 5, 16) // Green color for the wave
      ..style = PaintingStyle.fill; // Filling the wave

    final pathGreen = Path();
    pathGreen.moveTo(0.1, size.height);
    pathGreen.lineTo(0, size.height * 0.9); // Starting point for the wave

    for (var i = 0; i < size.width; i++) {
      final x = i.toDouble();
      final y = size.height * 0.91 +
          animationValue *
              12 *
              sin((i / size.width) * 2.3 * pi); // Calculate wave shape
      pathGreen.lineTo(x, y); // Define wave path
    }

    pathGreen.lineTo(size.width, size.height); // Complete the wave path
    pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen); // Draw the green wave
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the wave continuously
  }
}

class WaveAnimationDark extends StatefulWidget {
  @override
  _WaveAnimationDarkState createState() => _WaveAnimationDarkState();
}

class _WaveAnimationDarkState extends State<WaveAnimationDark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Synchronize animation with this widget
      duration: Duration(seconds: 3), // Animation duration
    )..repeat(reverse: true); // Repeat the animation back and forth
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context)
                  .size
                  .height), // Set the size of the custom paint
          painter: WavePainterDark(_controller
              .value), // Use the WavePainterDarkDark to paint the wave
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}
