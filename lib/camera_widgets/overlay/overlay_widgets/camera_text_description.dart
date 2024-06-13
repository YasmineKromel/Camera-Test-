
import 'package:flutter/material.dart';


class CameraTextDescription extends StatelessWidget {
   CameraTextDescription({super.key,
    this.description,
    this.topSpace
  });

  final String? description;
   double? topSpace ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding:  EdgeInsets.only(top: topSpace??125),
        child: Text(
          description??"",
          style:
          TextStyle(color: Colors.white,
            fontWeight: FontWeight.w700,fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
