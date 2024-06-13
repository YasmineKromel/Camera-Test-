import 'dart:typed_data';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';


import 'doc_one_image_preview.dart';
import 'instruction_screen_helper.dart';



class DocumentPreviewScreenBody extends StatelessWidget {
  const DocumentPreviewScreenBody({
    super.key,
    required this.imageList,
    required this.isAfterCapture,
    required this.imageFile,
    required this.documentType, 
    required this.bytes
  });

  final List<String> imageList;
  final bool isAfterCapture;
  final XFile imageFile ;
  final DocumentType documentType ;
  final  Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar [back - title]
            // AppbarDocPreview(
            //   screenTitle: "${context.translate.docReviewScreenTitle} photo",
            // ),

            // Doc Preview
            Expanded(
              child:
              // isAfterCapture
              //     ?
              DocOneImagePreview(
                      imagesPath: "", isAfterCapture: isAfterCapture, file: imageFile,
                documentType: documentType, bytes: bytes,
              ))
            //       : DocPreviewWidget(
            //           imagesList: imageList, isAfterCapture: isAfterCapture,
            //   ),
            // ),
            //
            // // Bottom area (buttons and confirmation message)
            // BottomMessageAndButtons(isAfterCapture: isAfterCapture)
          ],
        ),
      ),
    );
  }
}
