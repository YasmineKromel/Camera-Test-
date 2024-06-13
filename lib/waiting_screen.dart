
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


import 'docs_preview_screen.dart';
import 'image_util.dart';
import 'instruction_screen_helper.dart';


class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key,
    required this.controller,
    required this.file,
    required this.type
  });

  final XFile file ;
  final CameraController controller;
  final DocumentType type;

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    ImageUtil.doCropping(widget.file, widget.controller).then((value) {
      if(value != null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DocumentPreviewScreen(file: widget.file, type: widget.type, bytes: value)));

      }
    });
    super.initState();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1, 0),
                  end: Alignment(2, .5),
                  colors: [
                    Colors.white,
                    Colors.yellow,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Loading',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
