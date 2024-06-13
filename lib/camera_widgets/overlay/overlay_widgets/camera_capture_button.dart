
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import '../../../instruction_screen_helper.dart';
import '../../../utils.dart';
import '../../../waiting_screen.dart';


class CameraCaptureButton extends StatelessWidget {
  const CameraCaptureButton(
      {super.key, required this.controller, required this.type});

  final CameraController controller;
  final DocumentType type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await controller.takePicture().then((value){
          if(value!= null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => WaitingScreen(controller: controller, file: value, type: type,)));
          }
        });

      },
      child: Transform.scale(
        scaleX: Utils.isRtl(context) ? -1 : 1,
        child: Center(
          child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: Center(
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ))),
        ),
      ),
    );
  }
}
