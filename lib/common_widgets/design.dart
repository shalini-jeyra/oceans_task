import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  const Design({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: MediaQuery.of(context).size.height*0.35,
        
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();

    path.quadraticBezierTo(0, 0, size.width * 0.10, 0);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.40, size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.86, size.height * 0.72, size.width, size.height * 0.80);
    path.lineTo(size.width * 90, 0);
    path.close();

    paint.color = const Color.fromARGB(255,84,86,101);
    canvas.drawPath(path, paint);

    
    
    path = Path();

    path.quadraticBezierTo(0, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.50, size.height * 0.33,
        size.width * 0.66, size.height * 0.50);
    path.quadraticBezierTo(
        size.width * 0.66, size.height * 0.50, size.width*1, size.height * 0.69);
    path.lineTo(size.width * 90, 0);
    path.close();

    paint.color = const Color.fromARGB(255,102,104,117);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}