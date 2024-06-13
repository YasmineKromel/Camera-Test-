

import 'package:flutter/material.dart';


class CameraHint extends StatelessWidget {
  const CameraHint({super.key, this.hint});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 310.0),
        child: Container(
          width: 95,
          height: 35,
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius:const BorderRadius.horizontal(
              left: Radius.circular(50.0),
              right:  Radius.circular(50.0),
            ),
          ),
          child: Text(
            hint??"",
            style:
            TextStyle(color: Colors.blue,
              fontWeight: FontWeight.w700,fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
