import 'package:flutter/material.dart';
import 'package:rafia_unscramble_bloc/ui/screens/theme.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    Key? key,
    this.widget,
    this.color1,
    this.color2,
    this.color3,
  }) : super(key: key);

  final Widget? widget;
  final Color? color1;
  final Color? color2;
  final Color? color3;

  //  accepted data from drag to be stored as String
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Container(
            height: 34,
            width: 100,
            // add  border to the container
            decoration: BoxDecoration(
              //  if color1 is not null then assign it to container if it is null then assign color2 to the container else assign color3 to the container
              color: color1 ?? color2 ?? color3, // add shadow to container
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.13),
                  offset: const Offset(0, 3),
                  blurRadius: 13,
                  spreadRadius: 5,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              // add border to container
              border: Border.all(
                color: AppColors.white.withOpacity(1),
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: widget),
      ),
    );
  }
}
