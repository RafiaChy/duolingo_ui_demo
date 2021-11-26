import 'package:flutter/material.dart';
import 'package:rafia_unscramble_bloc/ui/screens/theme.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    Key? key,
    this.widget,
    this.color1,
    this.color2,
    this.color3,
    this.givenWidth,
    this.givenHeight,
  }) : super(key: key);

  final Widget? widget;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final double? givenWidth;
  final double? givenHeight;

  //  accepted datat from drap to be stored as String
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Container(
          width: givenWidth,
          height: givenHeight,
          decoration: BoxDecoration(
            //  if color1 is not null then assign it to container if it is null then assign color2 to the container else assign color3 to the container
            color: color1 ?? color2 ?? color3, // add shadow to container
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.13),
                offset: const Offset(0, 3),
                blurRadius: 0,
                spreadRadius: 1,
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            // add border to container
            border: Border.all(
              color: AppColors.border,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            child: widget,
          ),
        ),
      ),
    );
  }
}
