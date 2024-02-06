import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  const CanvasScreen({super.key});

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  double pressure = 0.0;
  double size = 0.0;
  int pointer = 0;
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (PointerDownEvent details) {
          setState(() {
            pressure = details.pressure;
            size = details.size;
            pointer = details.pointer;
            position = details.position;
          });
        },
        onPointerUp: (details) {
          setState(() {
            pressure = details.pressure;
            size = details.size;
            pointer = details.pointer;
            position = details.position;
          });
        },
        onPointerMove: (details) {
          setState(() {
            pressure = details.pressure;
            size = details.size;
            pointer = details.pointer;
            position = details.position;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Size : $size'),
              Text('pressure : $pressure'),
              Text('Pointer : $pointer'),
              Text('position : $position'),
            ],
          ),
        ),
      ),
    );
  }
}
