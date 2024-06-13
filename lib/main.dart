

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


import 'camera_screen.dart';
import 'instruction_screen_helper.dart';

late List<CameraDescription> cameras;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
  const Home(),
   // const ExampleCameraOverlay(format: OverlayFormat.cardID1,label:"ID Card", info: "Please point the camera at the ID Card" ,),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // child: TextButton(onPressed: (){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanScreen(type: DocumentType.idCardFront)));
      // }, child: Text("click me ")
      // ),
      home: ScanScreen(type: DocumentType.idCardFront),
    );
  }
}

// class ExampleCameraOverlay extends StatefulWidget {
//   const ExampleCameraOverlay({super.key, required this.format,
//     required this.label, required this.info});
//
//   final OverlayFormat format;
//   final String label;
//   final String info ;
//
//   @override
//   _ExampleCameraOverlayState createState() => _ExampleCameraOverlayState();
// }
//
// class _ExampleCameraOverlayState extends State<ExampleCameraOverlay> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home:
//         Scaffold(
//           backgroundColor: Colors.white,
//           body: FutureBuilder<List<CameraDescription>?>(
//             future: availableCameras(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data == null) {
//                   return const Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'No camera found',
//                         style: TextStyle(color: Colors.black),
//                       ));
//                 }
//                 return CameraOverlay(
//                     snapshot.data!.first,
//                     CardOverlay.byFormat(widget.format),
//                         (XFile file) => showDialog(
//                       context: context,
//                       barrierColor: Colors.black,
//                       builder: (context) {
//                         CardOverlay overlay = CardOverlay.byFormat(widget.format);
//                         // how capture returned
//                         return AlertDialog(
//                             actionsAlignment: MainAxisAlignment.center,
//                             backgroundColor: Colors.black,
//                             title: const Text('Capture',
//                                 style: TextStyle(color: Colors.white),
//                                 textAlign: TextAlign.center),
//                             actions: [
//                               OutlinedButton(
//                                   onPressed: () => Navigator.of(context).pop(),
//                                   child: const Icon(Icons.close))
//                             ],
//                             content: SizedBox(
//                                 width: double.infinity,
//                                 child: AspectRatio(
//                                   aspectRatio: overlay.ratio!,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                           fit: BoxFit.fitWidth,
//                                           alignment: FractionalOffset.center,
//                                           image: FileImage(
//                                             File(file.path),
//                                           ),
//                                         )),
//                                   ),
//                                 )));
//                       },
//                     ),
//                     info:widget.info,
//                     label: widget.label);
//               } else {
//                 return const Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Fetching cameras',
//                       style: TextStyle(color: Colors.black),
//                     ));
//               }
//             },
//           ),
//         )
//     );
//   }
// }
