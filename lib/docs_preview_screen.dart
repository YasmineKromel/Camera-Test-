
import 'dart:typed_data';


import 'package:camera/camera.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'document_preview_screen_body.dart';
import 'instruction_screen_helper.dart';




class DocumentPreviewScreen extends StatelessWidget {
  const DocumentPreviewScreen({super.key, required this.file, required this.type, required this.bytes});
  final  XFile file ;
  final DocumentType type ;
  final  Uint8List bytes;
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      // ImageAssets.announcement,
      // ImageAssets.blocked,
      // ImageAssets.announcement,
    ];

    return DocumentPreviewScreenBody(imageList: images, isAfterCapture : true, imageFile: file,documentType: type, bytes: bytes,);
  }
}

