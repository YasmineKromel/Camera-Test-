
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


import '../../instruction_screen_helper.dart';
import 'overlay_data_model.dart';
import 'overlay_widgets/camera_box_Scan_border.dart';
import 'overlay_widgets/camera_capture_button.dart';
import 'overlay_widgets/camera_header.dart';
import 'overlay_widgets/camera_hint.dart';
import 'overlay_widgets/camera_option_button.dart';
import 'overlay_widgets/camera_text_description.dart';

class CameraOverlay extends StatefulWidget {
  const CameraOverlay({super.key,
    required this.overlayData,
    required this.controller,
    required this.snapshot,
    required this.overlayShape,
    required this.type
  });
  final  CameraOverlayDataModel overlayData;
  final  OverlayModel overlayShape;
  final CameraController controller;
  final  AsyncSnapshot<List<CameraDescription>?> snapshot;
  final DocumentType type;

  @override
  State<CameraOverlay> createState() => _CameraOverlayState();
}

class _CameraOverlayState extends State<CameraOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          //align of header back and title

        ]);
  }
}





