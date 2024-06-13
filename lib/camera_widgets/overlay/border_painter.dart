
import 'package:flutter/material.dart';


// Creates the white borders
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 2.0;
    const radius = 20.0;
    const tRadius = 3 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width -2  * width,
      size.height -2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class BorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double sh = size.height; // for convenient shortage
//     double sw = size.width; // for convenient shortage
//     double cornerSide = sh * 0.05; // desirable value for corners side
//
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 1.5
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     Path path = Path()
//       ..moveTo(cornerSide, 0)
//       ..quadraticBezierTo(0, 0, 0, cornerSide)
//       ..moveTo(0, sh - cornerSide)
//       ..quadraticBezierTo(0, sh, cornerSide, sh)
//       ..moveTo(sw - cornerSide, sh)
//       ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
//       ..moveTo(sw, cornerSide)
//       ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(BorderPainter oldDelegate) => false;
//
//   @override
//   bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
// }