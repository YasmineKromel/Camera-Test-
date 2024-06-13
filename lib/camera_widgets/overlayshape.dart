import 'package:flutter/material.dart';

import '../instruction_screen_helper.dart';
import 'overlay/overlay_data_model.dart';

class OverlayShape extends StatelessWidget {
  const OverlayShape(
      {super.key,
        required this.model,
        required this.showBorder,
        this.isCircle,
        this.isHrLitter,
        required this.type
        // required this.format
      });

  final OverlayModel model;
  final bool showBorder;
  final bool? isCircle;
  final bool? isHrLitter;
  final DocumentType type;
  // final OverlayFormat format;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var size = media.size;
    double width = media.orientation == Orientation.portrait
        ? size.shortestSide * .9
        : size.longestSide * .5;

    double ratio = model.ratio as double;
    double height = width / ratio;
    double radius =
    model.cornerRadius == null ? 0 : model.cornerRadius! * height;
    if (media.orientation == Orientation.portrait) {}
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width,
            height: width / ratio,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: isCircle == null ?
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: const BorderSide(
                  width: 1,
                  color: Colors.transparent,
                ),
              )
                  : CircleBorder(
                side: BorderSide(
                  width: 1,
                  color: showBorder ? Colors.white : Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black26,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: isCircle == null
                      ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: AspectRatio(
                      aspectRatio: type.ratio,
                      // format == OverlayFormat.cardID1
                      //     ? 47 / 30
                      //     : 0.70,
                      child: Container(
                      //  margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(radius),
                        ),
                      ),
                    ),
                  )
                  // Container(
                  //     width: width,
                  //     height: width / ratio,
                  //     // width: 329.w,
                  //     // height: 210.h,
                  //     decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(radius),
                  //     ),
                  //   )
                      : Container(
                    width: width,
                    height: width / ratio,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}