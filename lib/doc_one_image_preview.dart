
import 'dart:typed_data';


import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../camera_widgets/overlay/overlay_data_model.dart';
import 'instruction_screen_helper.dart';



class DocOneImagePreview extends StatelessWidget {
  const DocOneImagePreview(
      {super.key, required this.imagesPath, required this.isAfterCapture,
        required this.file,
        required this.documentType,
        required this.bytes
      });

  final String imagesPath;
  final bool isAfterCapture;
  final XFile file ;
  final DocumentType documentType;
  final  Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // just trying to preview the capture
            AspectRatio(
              aspectRatio: documentType.ratio,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child:  Image.memory(
                  bytes,
                  //  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



