import 'package:flutter/material.dart';

class AppColors {
  static const lightBlue1 = Color(0xFF30AAFF);
  static const lightBlue2 = Color(0xFF33CFFF);
  static const orange1 = Color(0xFFF15A24);
  static const orange2 = Color(0xFFF68F1F);
  static const green = Color(0xFF00A76B);
  static const red = Color(0xFFCA0000);
  static const white = Color(0xFFFFFFFF);
  static const darkGrey = Color(0xFFAEAEAE);
  static const grey = Color(0xFFD9D9D9);
  static const lightGrey = Color(0xFFECEBF0);
  static const border = Color(0xFF696969);
  static const nearBlack = Color(0xFF131921);
  static const shadowBlack = Color(0x19000000); // Opacity 25/255
  static const darkShadowBlack = Color(0x32000000); // Opacity 50/255
  static const black = Color(0xFF000000);
  static const transparent = Color(0x00000000);
  static const appBackground = Color(0xFF252525);
}

class AppGradients {
  static const primaryLinear = LinearGradient(
    colors: <Color>[
      AppColors.lightBlue1,
      AppColors.lightBlue2,
    ],
  );
  static const accentLinear = LinearGradient(
    colors: <Color>[
      AppColors.orange1,
      AppColors.orange2,
    ],
  );
}

class AppTheme {
  static String primaryFont = "Poppins";
  static String secondaryFont = "Nunito";
  static String tertiaryFont = "Montserrat";

  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.nearBlack,
      backgroundColor: AppColors.lightGrey,
      scaffoldBackgroundColor: AppColors.lightGrey,
      errorColor: AppColors.red,
      shadowColor: AppColors.shadowBlack,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightGrey,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: primaryFont,
          fontSize: 24,
          fontWeight: FontWeight.w300,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: primaryFont,
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: AppColors.black,
        ),
        headline2: TextStyle(
          fontFamily: primaryFont,
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: AppColors.black,
        ),
        headline3: TextStyle(
          fontFamily: primaryFont,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        headline4: TextStyle(
          fontFamily: primaryFont,
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.black,
        ),
        headline5: TextStyle(
          fontFamily: primaryFont,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        headline6: TextStyle(
          fontFamily: primaryFont,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: AppColors.black,
        ),
        subtitle1: TextStyle(
          fontFamily: secondaryFont,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: AppColors.black,
        ),
        subtitle2: TextStyle(
          fontFamily: secondaryFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: AppColors.black,
        ),
        bodyText1: TextStyle(
          fontFamily: secondaryFont,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: AppColors.black,
        ),
        bodyText2: TextStyle(
          fontFamily: secondaryFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: AppColors.border,
        ),
        button: TextStyle(
          fontFamily: primaryFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: AppColors.white,
        ),
        caption: TextStyle(
          fontFamily: tertiaryFont,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: AppColors.black,
        ),
        overline: TextStyle(
          fontFamily: tertiaryFont,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: AppColors.black,
        ),
      ),
    );
  }
}
