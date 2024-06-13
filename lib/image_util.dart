import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as imglib;
import 'package:camera/camera.dart';

class  ImageUtil{

  static Future<Uint8List?> convertXFileToBytes(XFile xFile) async {
    try {
      final bytes = await File(xFile.path).readAsBytes();
      return bytes;
    } catch (e) {
      print('Error converting XFile to bytes: $e');
      return null;
    }
  }

  static Future<imglib.Image?> convertBytesToImage(Uint8List bytes) async {
    final imglib.Image? image = imglib.decodeImage(bytes);
    return image;
  }

  static Future<Uint8List> convertImageToBytes(imglib.Image  Image) async {
   return imglib.encodeJpg(Image);
  }

  /// Get Crop Rectangle from given sizes
 static Rectangle<int> getCropRect({
    required int sourceWidth,
    required int sourceHeight,
    required double aspectRatio,
  }) {
    var left = 0;
    var top = 0;
    var width = sourceWidth;
    var height = sourceHeight;
    if (aspectRatio < sourceWidth / sourceHeight) {
      // crop horizontally, from width
      width = (sourceHeight * aspectRatio).toInt(); // set new cropped width
      left = (sourceWidth - width) ~/ 2;
    } else if (aspectRatio > sourceWidth / sourceHeight) {
      // crop vertically, from height
      height = sourceWidth ~/ aspectRatio; // set new cropped height
      top = (sourceHeight - height) ~/ 2;
    }
    // else source and destination have same aspect ratio
    return Rectangle<int>(left, top, width, height);
  }

  /// Center crop the source image with given aspectRatio
 static imglib.Image? centerCrop(ImageCropData imageCropData) {
   final image = imageCropData.image;
   if (image == null) {
     return null;
   }

    final rect = getCropRect(
        sourceWidth: imageCropData.image!.width,
        sourceHeight: imageCropData.image!.height,
        aspectRatio: imageCropData.aspectRatio!);
    return imglib.copyCrop(imageCropData.image!,
        x: rect.left, y: rect.top, width: rect.width, height: rect.height);
  }

  static Future<Uint8List?> doCropping ( XFile file ,CameraController controller) async {
    final imageBytes = await compute(ImageUtil.convertXFileToBytes, file);
    imglib.Image? convertedImage = await compute(
          (Uint8List? bytes) async => bytes != null
          ? await ImageUtil.convertBytesToImage(bytes)
          : null,
      imageBytes,
    );
    imglib.Image? croppedImage = await compute(
      ImageUtil.centerCrop,
      ImageCropData(
        image: convertedImage,
        aspectRatio: controller.value.aspectRatio,
      ),
    );
    if (croppedImage != null) {
      final Uint8List bytes = await compute(ImageUtil.convertImageToBytes, croppedImage);
      return bytes;
    }
    return null;
  }

  // imglib.Image? convertedImage =
  // await compute(convertImageBytesToImage, item.image);
  //
  // imglib.Image? croppedImage = await compute(
  // centerCrop,
  // ImageCropData(
  // image: convertedImage,
  // aspectRatio: e.cameraController.value.aspectRatio,
  // ),
  // );



  //https://pub.dev/packages/image


  //https://github.com/brendan-duncan/image/blob/main/lib/src/transform/copy_crop.dart
}


class ImageCropData {
  final imglib.Image? image;
  final double? aspectRatio;
  ImageCropData({
     this.image,
     this.aspectRatio,
  });
}