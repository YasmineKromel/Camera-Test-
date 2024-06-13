


import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'camera_widgets/camera_body_widget.dart';
import 'camera_widgets/overlay/overlay_data_model.dart';
import 'instruction_screen_helper.dart';
import 'main.dart';




class ScanScreen extends StatefulWidget {
  DocumentType type;
  ScanScreen({super.key, required this.type,
  });

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late final CameraController controller;

@override
  void initState() {
  controller = CameraController(cameras[0], ResolutionPreset.high,);
  controller.initialize().then((_) {
    controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
    if (!mounted) {
      return;
    }
    setState(() {});
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No camera found',
                    style: TextStyle(color: Colors.black),
                  ));
            }
           Widget body = getCameraBody(snapshot,widget.type);
            return body ;
          } else {
            return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Fetching cameras',
                  style: TextStyle(color: Colors.black),
                ));
          }
        },
      ),
    );

  }


  Widget getCameraBody(AsyncSnapshot<List<CameraDescription>?> snapshot,DocumentType type){
    switch (type){
      case DocumentType.personalPhoto:
        return CameraBodyWidget(snapshot: snapshot, controller: controller ,overlayData:
        CameraOverlayDataModel(
          // desiredHeight: DocumentType.personalPhoto.rectangle.height,
          // desiredWidth: DocumentType.personalPhoto.rectangle.width,
          overlayColour: Colors.black.withOpacity(0.5),
          description:  "positionYourFaceFullyWithinTheFrame",
          title: "livenessSelfieCheck",), type: widget.type, overlayShape: CardOverlay.byFormat(OverlayFormat.faceID),);
      case DocumentType.idCardFront:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight:DocumentType.idCardFront.rectangle.height,
            // desiredWidth: DocumentType.idCardFront.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description:  "pleasePointTheCameraAtTheIDCard",
            topSapce: 200,
            hint:"idFrontSide",
            title: "idCard",),type: widget.type,overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.idCardBack:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight:DocumentType.idCardBack.rectangle.height,
            // desiredWidth: DocumentType.idCardBack.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description: "pleasePointTheCameraAtTheIDCard",
            topSapce: 200,
            hint: "idBackSide",
            title:"idCard",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.driverLicense:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight:DocumentType.driverLicense.rectangle.height,
            // desiredWidth: DocumentType.driverLicense.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            topSapce: 200,
            description: "pleasePointTheCameraAtTheLicense",
            title: "driverLicense",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.carLicenseFront:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.carLicenseFront.rectangle.height,
            // desiredWidth: DocumentType.carLicenseFront.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            topSapce: 200,
            description: "pleasePointTheCameraAtTheLicense",
            hint: "frontSide",
            title:"carLicense",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.carLicenseBack:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.carLicenseBack.rectangle.height,
            // desiredWidth: DocumentType.carLicenseBack.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description: "pleasePointTheCameraAtTheLicense",
            topSapce: 200,
            hint: "backSide",
            title: "carLicense",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.carInspection:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.carInspection.rectangle.height,
            // desiredWidth: DocumentType.carInspection.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description:  "pleaseScanInspectionPaperWithinTheFrame",
            title: "carInspectionRecord",), type: widget.type,overlayShape:  CardOverlay.byFormat(OverlayFormat.a4),
        );
      case DocumentType.carPhotoFront:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.carPhotoFront.rectangle.height,
            // desiredWidth:DocumentType.carPhotoFront.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            topSapce: 200,
            description: "pleasePointTheCameraAtTheFrontSideOfCar",
            hint: "carFrontSide",
            title: "carPhoto",), type: widget.type,overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.carPhotoBack:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
            overlayData:CameraOverlayDataModel(
              // desiredHeight: DocumentType.carPhotoBack.rectangle.height,
              // desiredWidth:DocumentType.carPhotoBack.rectangle.width,
              overlayColour: Colors.black.withOpacity(0.5),
              topSapce: 200,
              description: 'pleasePointTheCameraAtTheBackSideOfCar',
              hint: "carBackSide",
              title: "carBackPhoto",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1)
        );
      case DocumentType.carPhotoRight:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.carPhotoRight.rectangle.height,
            // desiredWidth:DocumentType.carPhotoRight.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            topSapce: 200,
            description: "pleasePointTheCameraAtTheRightSideOfCar",
            hint: "carRightSide",
            title:"carRightSidePhoto",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );
      case DocumentType.carPhotoLeft:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.carPhotoLeft.rectangle.height,
            // desiredWidth:DocumentType.carPhotoLeft.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description:  "pleasePointTheCameraAtTheLeftSideOfCar",
            hint: "carLeftSide",
            topSapce: 200,
            title: "carLeftSidePhoto",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),
        );

      case DocumentType.drugTestPaper:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight:DocumentType.drugTestPaper.rectangle.height,
            // desiredWidth: DocumentType.drugTestPaper.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description: "pleaseScanDrugTestPaperWithinTheFrame",
            title: "drugTest",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.a4),
        );

      case DocumentType.criminalRecordCert:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.criminalRecordCert.rectangle.height,
            // desiredWidth: DocumentType.criminalRecordCert.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description:  "pleasePointTheCameraAtTheCertificate",
            title: "criminalRecordCertificate",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.a4),
        );
      default:
        return CameraBodyWidget(snapshot: snapshot, controller: controller,
          overlayData:CameraOverlayDataModel(
            // desiredHeight: DocumentType.personalPhoto.rectangle.height,
            // desiredWidth: DocumentType.personalPhoto.rectangle.width,
            overlayColour: Colors.black.withOpacity(0.5),
            description: "positionYourFaceFullyWithinTheFrame",
            title: "livenessSelfieCheck",), type: widget.type, overlayShape:  CardOverlay.byFormat(OverlayFormat.cardID1),

        );
    }
  }
}
