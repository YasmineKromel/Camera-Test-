
import 'dart:ui';
import '../../instruction_screen_helper.dart';

// enum DocumentType{
//   selfie,
//   idCardFront,
//   idCardBack,
//   driverLicense,
//   carLicenseFront,
//   carLicenseBack,
//   criminalRecord,
//   drugTest,
//   carPhotoFront,
//   carPhotoBack,
//   carPhotoRight,
//   carPhotoLeft,
//   carInspection
// }
// // faceID  W= 267  H = 379 , ratio = 1.42
// // cardID  w= 327  h = 231
// // driverLicense w = 327 , h =231
// // car license  w= 327 , h=231
// //  criminal record w = 320  h = 441
// // drug test w = 327 h =488
// // car photo w = 327 , h= 231
// // car inspection  w = 327 h =488
//
//
extension RectangleSize on DocumentType {
  double get ratio {
    switch (this) {
      case DocumentType.personalPhoto:
        return  267/379;
    //const Rect.fromLTWH(0,0,267,379);
      case DocumentType.idCardFront:
        return 47/30;
    //  const Rect.fromLTWH(0,0,327,231);
      case DocumentType.idCardBack:
        return  47/30;
    // const Rect.fromLTWH(0,0,327,231);
      case DocumentType.driverLicense:
        return 47/30;
    //  const Rect.fromLTWH(0,0,327,231);
      case DocumentType.carLicenseFront:
        return 47/30;
    //  const Rect.fromLTWH(0,0,327,231);
      case DocumentType.carLicenseBack:
        return 47/30;
    //  const Rect.fromLTWH(0,0,327,231);
      case DocumentType.criminalRecordCert:
        return  0.70;
    //const Rect.fromLTWH(0,0,300,430);
      case DocumentType.drugTestPaper:
        return  0.70;
    // const Rect.fromLTWH(0,0,300,430);
      case DocumentType.carPhotoFront:
        return  109/77;
    // const Rect.fromLTWH(0,0,327,231);
      case DocumentType.carPhotoBack:
        return 109/77;
    // const Rect.fromLTWH(0,0,327,231);
      case DocumentType.carPhotoRight:
        return 109/77;
    // const Rect.fromLTWH(0,0,327,231);
      case DocumentType.carPhotoLeft:
        return  109/77;
    // const Rect.fromLTWH(0,0,327,231);
      case DocumentType.carInspection:
        return 47/30;
    //const Rect.fromLTWH(0,0,300,430);
    }
  }
}
//
//
//
class CameraOverlayDataModel {
  final Color overlayColour;
  final String title;
  final String? description;
  final String? hint;
  //final double desiredHeight;
  // final double desiredWidth;
  final double? topSapce;
  CameraOverlayDataModel({
    required this.overlayColour,
    required this.title,
    this.description,
    this.topSapce,
    this.hint,
    // required this.desiredHeight,
    // required this.desiredWidth,
  });

}

///ISO Card formats
///https://www.iso.org/standard/70483.html
enum OverlayFormat {
  ///Personal Photo
  faceID,
  ///A4 document
  a4,
  ///car photo
  carPhoto,
  ///Most banking cards and ID cards
  cardID1,

  ///French and other ID cards. Visas.
  cardID2,

  ///United States government ID cards
  cardID3,

  ///SIM cards
  simID000
}
enum OverlayOrientation { landscape, portrait }

abstract class OverlayModel {
  ///ratio between maximum allowable lengths of shortest and longest sides
  double? ratio;


  ///ratio between maximum allowable radius and maximum allowable length of shortest side
  double? cornerRadius;

  ///natural orientation for overlay
  OverlayOrientation? orientation;
}

class CardOverlay implements OverlayModel {
  CardOverlay(
      {this.ratio = 1.5,
        this.cornerRadius = 0.66,
        this.orientation = OverlayOrientation.portrait});

  @override
  double? ratio;
  @override
  double? cornerRadius;
  @override
  OverlayOrientation? orientation;

  static byFormat(OverlayFormat format) {
    switch (format) {
      case (OverlayFormat.cardID1):
        return CardOverlay(ratio: 1.59, cornerRadius: 0.064 );
      case (OverlayFormat.cardID2):
        return CardOverlay(ratio: 1.42, cornerRadius: 0.067);
      case (OverlayFormat.cardID3):
        return CardOverlay(ratio: 1.42, cornerRadius: 0.057);
      case (OverlayFormat.simID000):
        return CardOverlay(ratio: 1.66, cornerRadius: 0.073);
      case OverlayFormat.faceID:
        return CardOverlay(ratio:1.59, cornerRadius: 0.064 );
      case OverlayFormat.a4:
        return CardOverlay(ratio: 1.59, cornerRadius: 0.064 );
      case OverlayFormat.carPhoto:
        return CardOverlay(ratio: 1.59, cornerRadius: 0.064 );
    }
  }
}
