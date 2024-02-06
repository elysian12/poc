import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poc/auth_screen.dart';
import 'package:poc/canvas_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CanvasScreen(),
    );
  }
}

class SvgPainterWidget extends StatefulWidget {
  const SvgPainterWidget({super.key});

  @override
  State<SvgPainterWidget> createState() => _SvgPainterWidgetState();
}

class _SvgPainterWidgetState extends State<SvgPainterWidget> {
  late Picture picture;
  Offset cursorPosition = const Offset(10, 10);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            cursorPosition = details.globalPosition;
          });
        },
        child: ColoredBox(
          color: Colors.orange,
          child: CustomPaint(
            size: const Size(1000, 1000),
            painter: MouseCursorPainter(cursorPosition, 'Aman'),
          ),
        ),
      ),
    );
  }
}

class SvgPainter extends CustomPainter {
  final Picture picture;

  SvgPainter(this.picture);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPicture(picture);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MouseCursorPainter extends CustomPainter {
  final Offset position;
  final String name;

  MouseCursorPainter(this.position, this.name);

  @override
  void paint(Canvas canvas, Size size) {
    Paint cursorPaint = Paint()
      ..color = Colors.blue // Customize the cursor color
      ..style = PaintingStyle.fill;

    Paint textPaint = Paint()
      ..color = Colors.black // Customize the text color
      ..style = PaintingStyle.fill;
    // ..textAlign = TextAlign.center
    // ..textBaseline = TextBaseline.alphabetic;

    // canvas.drawCircle(position, 20, cursorPaint);

    Path path_0 = Path();
    path_0.moveTo(position.dx + 7.5, position.dy + 39);
    path_0.lineTo(position.dx + 0, position.dy + 0);
    path_0.lineTo(position.dx + 33, position.dy + 19.5);
    path_0.lineTo(position.dx + 16.5, position.dy + 24);
    path_0.lineTo(position.dx + 7.5, position.dy + 39);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffEF5533).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Paint roundedRectPaint = Paint()
      ..color = const Color(0xffEF5533).withOpacity(1.0)
      ..style = PaintingStyle.fill;

    double borderRadius = 3.0;

    TextSpan span = TextSpan(
      text: name,
      style: const TextStyle(
        fontSize: 16,
      ),
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();

    // Draw the rounded rectangle
    RRect roundedRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(position.dx + tp.width + 10, position.dy + 50),
        width: tp.width + 30,
        height: 31,
      ),

      // Rect.fromPoints(position - const Offset(0, 0),
      //     Offset(position.dx + 100, position.dy + 30)),
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    canvas.drawRRect(roundedRect, roundedRectPaint);

    tp.paint(
      canvas,
      Offset(position.dx + tp.width / 1.5, position.dy + 40),
    ); // Adjust the text position
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
