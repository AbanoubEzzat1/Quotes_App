import 'package:flutter/material.dart';
import 'package:quotes/features/random_quote/presentation/resources/colors_manger.dart';
import 'package:quotes/features/random_quote/presentation/resources/font_manger.dart';
import 'package:quotes/features/random_quote/presentation/resources/style_manger.manger.dart';
import 'package:quotes/features/random_quote/presentation/resources/values_manger.dart';

ThemeData getAppThemDatat() {
  return ThemeData(
    // -- MainColors --
    primaryColor: ColorsManger.primary,
    hintColor: ColorsManger.grey,
    errorColor: ColorsManger.erorr,
    disabledColor: ColorsManger.grey1,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManger.white,

    // -- AppBarTheme --
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManger.white,
      elevation: AppSize.s0,
      shadowColor: ColorsManger.lightPrimary,
      titleTextStyle: getExtraBold(
        color: ColorsManger.black,
        fontSize: FontSize.s22,
      ),
    ),
    //-- TextThem --
    textTheme: TextTheme(
      headlineLarge: getBlack(
        color: ColorsManger.black,
        fontSize: FontSize.s16,
      ),
      titleMedium: getExtraBold(color: ColorsManger.black),
      titleSmall: getBold(color: ColorsManger.black),
      headlineMedium: getMedium(color: ColorsManger.black),
      bodyLarge: getRegular(color: ColorsManger.black),
      bodySmall: getLight(
        color: Colors.black,
      ),
      displayLarge: getExtraLight(
        color: ColorsManger.black,
      ),
      bodyMedium: getRegular(color: ColorsManger.white, fontSize: FontSize.s22),
    ),
  );
}
