

import 'package:flutter/material.dart';

class CameraHeader extends StatelessWidget {
  const CameraHeader({super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.black26,
        child:  Padding(
          padding: const EdgeInsets.only(top:35.0,left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const FittedBox(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  Text(
                   "back",
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              const SizedBox(height: 12,),
              Text(
                title,
                style:
                TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w700,fontSize: 18,
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}
