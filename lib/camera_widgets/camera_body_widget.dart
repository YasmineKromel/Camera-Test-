import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test12/camera_widgets/overlay/border_painter.dart';
import '../instruction_screen_helper.dart';
import 'overlay/camera_overlay.dart';
import 'overlay/overlay_data_model.dart';
import 'overlay/overlay_widgets/camera_box_Scan_border.dart';
import 'overlay/overlay_widgets/camera_capture_button.dart';
import 'overlayshape.dart';

class CameraBodyWidget extends StatefulWidget {
  CameraBodyWidget(
      {super.key,
        required this.snapshot,
        required this.controller,
        required this.overlayData,
        required this.overlayShape,
        required this.type});
  AsyncSnapshot<List<CameraDescription>?> snapshot;
  final CameraController controller;
  final CameraOverlayDataModel overlayData;
  final OverlayModel overlayShape ;
  DocumentType type;
  @override
  State<CameraBodyWidget> createState() => _CameraBodyWidgetState();
}

class _CameraBodyWidgetState extends State<CameraBodyWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.type == DocumentType.personalPhoto) {
      widget.controller.setDescription(widget.snapshot.data!.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front));
    } else {
      widget.controller.setDescription(widget.snapshot.data!.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.back));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          // camera preview widget 
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CameraPreview(widget.controller),
          ),
          OverlayShape( showBorder: false, model: widget.overlayShape, type: widget.type,),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AspectRatio(
                aspectRatio: widget.type.ratio,
                child: CustomPaint(
                  foregroundPainter: BorderPainter(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 113,
              width: double.infinity,
              color: Colors.black26,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CameraOptionButton(assetName: IconAssets.uTurn, pressed: (){
                  //   var cameraState =  widget.controller.description.lensDirection;
                  //   if(cameraState == CameraLensDirection.back)
                  //   {
                  //     widget.controller.setDescription(widget.snapshot.data!.firstWhere(
                  //             (camera) => camera.lensDirection == CameraLensDirection.front));
                  //   }else{
                  //     widget.controller.setDescription(widget.snapshot.data!.firstWhere(
                  //             (camera) => camera.lensDirection == CameraLensDirection.back));
                  //   }
                  // },),
                  const SizedBox(
                    width: 32,
                  ),
                  CameraCaptureButton(controller:widget.controller,type:widget.type ,),
                  const SizedBox(
                    width: 32,
                  ),
                  // CameraOptionButton(assetName: IconAssets.flash, pressed: () async {
                  //   var currentFlashMode = widget.controller.value.flashMode;
                  //   if (currentFlashMode == FlashMode.off ||currentFlashMode == FlashMode.auto) {
                  //     currentFlashMode = FlashMode.torch;
                  //   } else {
                  //     currentFlashMode = FlashMode.off;
                  //   }
                  //   await widget.controller.setFlashMode(currentFlashMode).then((value) =>  setState(() {}));
                  // },),
                ],
              ),
            ),
          )
      // SizedBox(
      //    width: MediaQuery.sizeOf(context).width,
      //     height: MediaQuery.sizeOf(context).height,
      //     child: CameraPreview(widget.controller)),
      // // CameraOverlay(
      // //     type: widget.type ,
      // //     overlayData: widget.overlayData,
      // //     controller: widget.controller,
      // //     snapshot: widget.snapshot,
      // //     overlayShape: widget.overlayShape
      // // )
      // // CameraHeader(title:widget.overlayData.title),
      // //  description
      // // CameraTextDescription(description: widget.overlayData.description,topSpace: widget.overlayData.topSapce,),
      // // Camera Box
      // // const CameraBoxWithScanningBorder(
      // //   overlayColour: widget.model.overlayColour,
      // //  desiredHeight:379,
      // //   desiredWidth: 267,
      // //   showBorder: true,
      // //   format: OverlayFormat.cardID1, showBorder: null,
      // // ),
      // CameraBoxWithScanningBorder(
      //   widget.overlayShape,
      //   type: widget.type,
      //   showBorder: true,
      // ),
      // // camera hint
      // // widget.overlayData.hint != null? CameraHint(hint:widget.overlayData.hint): const SizedBox(),
      // //camera buttons

    ]);
  }
}
