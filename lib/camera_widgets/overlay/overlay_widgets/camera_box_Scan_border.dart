// //
// // import 'package:flutter/material.dart';
// //
// // import '../border_painter.dart';
// //
// // class CameraBoxWithScanningBorder extends StatelessWidget {
// //   const CameraBoxWithScanningBorder({super.key,
// //     required this.overlayColour,
// //     required this.desiredHeight,
// //     required this.desiredWidth,
// //   });
// //
// //   final Color overlayColour;
// //   final double desiredHeight;
// //   final double desiredWidth;
// //   @override
// //   Widget build(BuildContext context) {
// //     var media = MediaQuery.of(context);
// //     var size = media.size;
// //     // double desiredWidth = 267;
// //     // double desiredHeight = 379;
// //     double scaleFactorH = desiredHeight / size.height;
// //     double scaleFactorW = desiredWidth / size.width;
// //     // double width =
// //     //     //size.width;
// //     // media.orientation == Orientation.portrait
// //     //     ? size.shortestSide * .9
// //     //     : size.longestSide * .5;
// //   //  double ratio = size.height/size.width;
// //     return Stack(
// //       children: [
// //         ColorFiltered(
// //           colorFilter: ColorFilter.mode(
// //               overlayColour, BlendMode.srcOut), // This one will create the magic
// //           child: Stack(
// //             children: [
// //               Container(
// //                 decoration:  const BoxDecoration(
// //                  //   color: Colors.red,
// //                  //    backgroundBlendMode: BlendMode
// //                  //        .dstOut
// //                 ), // This one will handle background + difference out
// //               ),
// //               Align(
// //                 alignment: Alignment.center,
// //                 child: Container(
// //                   height: size.height*scaleFactorH,
// //                   width: size.width*scaleFactorW,
// //                   decoration: BoxDecoration(
// //                   //  color: Colors.red,
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         Align(
// //           alignment: Alignment.center,
// //           child:
// //           CustomPaint(
// //             foregroundPainter: BorderPainter(),
// //             child:  SizedBox(
// //               width: size.width*scaleFactorW+5 ,
// //               height:size.height*scaleFactorH+5,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
// // width: width*0.75+5 ,
// // height:width*1.9/ratio+5,
//
// import 'package:flutter/material.dart';
//
// import '../../../instruction_screen_helper.dart';
// import '../border_painter.dart';
// import '../overlay_data_model.dart';
//
// class CameraBoxWithScanningBorder extends StatelessWidget {
//   const CameraBoxWithScanningBorder(this.model,
//       {super.key,
//         required this.showBorder, required this.type,
//         this.isCircle,
//         this.isHrLitter,
//         //required this.overlayColour,
//         // required this.desiredHeight,
//         // required this.desiredWidth,
//         //required this.format
//       });
//
//   final OverlayModel model;
//   final bool showBorder;
//   final bool? isCircle;
//   final bool? isHrLitter;
//   final DocumentType type;
//   // final Color overlayColour;
//   // final double desiredHeight;
//   // final double desiredWidth;
//   // final OverlayFormat format;
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context);
//     var size = media.size;
//     double width = media.orientation == Orientation.portrait
//         ? size.shortestSide * .9
//         : size.longestSide * .5;
//
//     double ratio = model.ratio as double;
//     double height = width / ratio;
//     double radius =
//     model.cornerRadius == null ? 0 : model.cornerRadius! * height;
//     if (media.orientation == Orientation.portrait) {}
//     return Stack(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             width: width,
//             height: width / ratio,
//             decoration: ShapeDecoration(
//               color: Colors.transparent,
//               shape: isCircle == null
//                   ? RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(radius),
//                 side: const BorderSide(
//                   width: 1,
//                   color: Colors.transparent,
//                 ),
//               )
//                   : CircleBorder(
//                 side: BorderSide(
//                   width: 1,
//                   color: showBorder ? Colors.white : Colors.transparent,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         ColorFiltered(
//           colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcOut),
//           child: Stack(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.black26,
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: isCircle == null
//                       ? Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                     ),
//                     child: AspectRatio(
//                       aspectRatio: type.ratio,
//                       // format == OverlayFormat.cardID1
//                       //     ? 47 / 30
//                       //     : 0.70,
//                       child: CustomPaint(
//                         foregroundPainter: BorderPainter(),
//                         child: Container(
//                           margin: const EdgeInsets.only(top: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(radius),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   // Container(
//                   //     width: width,
//                   //     height: width / ratio,
//                   //     // width: 329.w,
//                   //     // height: 210.h,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.black,
//                   //       borderRadius: BorderRadius.circular(radius),
//                   //     ),
//                   //   )
//                       : Container(
//                     width: width,
//                     height: width / ratio,
//                     decoration: const BoxDecoration(
//                       color: Colors.black26,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // Container(
//         //   decoration: const BoxDecoration(
//         //     color: Colors.black26,
//         //   ),
//         //   child: Align(
//         //     alignment: Alignment.center,
//         //     child: isCircle == null
//         //         ? Padding(
//         //       padding: const EdgeInsets.symmetric(
//         //         horizontal: 25,
//         //       ),
//         //       child: AspectRatio(
//         //         aspectRatio: type.ratio,
//         //         // format == OverlayFormat.cardID1
//         //         //     ? 47 / 30
//         //         //     : 0.70 ,
//         //         child: Padding(
//         //           padding: const EdgeInsets.only(top: 0),
//         //           child: CustomPaint(
//         //             foregroundPainter: BorderPainter(),
//         //             child: Container(
//         //               //margin: const EdgeInsets.only(top: 30),
//         //               decoration: BoxDecoration(
//         //                 color: Colors.transparent,
//         //                 borderRadius: BorderRadius.circular(radius),
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //     )
//         //     // Container(
//         //     //     width: width,
//         //     //     height: width / ratio,
//         //     //     // width: 329.w,
//         //     //     // height: 210.h,
//         //     //     decoration: BoxDecoration(
//         //     //       color: Colors.black,
//         //     //       borderRadius: BorderRadius.circular(radius),
//         //     //     ),
//         //     //   )
//         //         : Container(
//         //       width: width,
//         //       height: width / ratio,
//         //       decoration: const BoxDecoration(
//         //         color: Colors.black26,
//         //         shape: BoxShape.circle,
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
