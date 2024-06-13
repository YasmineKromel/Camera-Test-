
import 'package:flutter/material.dart';

import '../../../utils.dart';



class CameraOptionButton extends StatefulWidget {
  const CameraOptionButton({super.key,
    required this.assetName,
    required this.pressed
  });
  final String assetName;
  final void Function()? pressed;

  @override
  State<CameraOptionButton> createState() => _CameraOptionButtonState();
}

class _CameraOptionButtonState extends State<CameraOptionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.pressed,
      child: Transform.scale(
        scaleX: Utils.isRtl(context) ? -1 : 1,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            height: 44,
            width: 44,
            // child: SvgPicture.asset(
            //   width: 24,
            //   height: 24,
            //   fit: BoxFit.scaleDown,
            //   widget.assetName,
            // ),
          ),
        ),
      ),
    );
  }
}

