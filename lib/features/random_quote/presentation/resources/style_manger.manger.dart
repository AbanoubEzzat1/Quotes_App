import 'package:flutter/material.dart';

import 'package:quotes/features/random_quote/presentation/resources/font_manger.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontFamily: FontConstant.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getBlack({
  required Color color,
  double fontSize = FontSize.s14,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.black,
    color,
  );
}

TextStyle getExtraBold({
  required Color color,
  double fontSize = FontSize.s16,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.extraBold,
    color,
  );
}

TextStyle getBold({
  required Color color,
  double fontSize = FontSize.s16,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.bold,
    color,
  );
}

TextStyle getMedium({
  required Color color,
  double fontSize = FontSize.s16,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.medium,
    color,
  );
}

TextStyle getRegular({
  required Color color,
  double fontSize = FontSize.s16,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.regular,
    color,
  );
}

TextStyle getLight({
  required Color color,
  double fontSize = FontSize.s16,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.light,
    color,
  );
}

TextStyle getExtraLight({
  required Color color,
  double fontSize = FontSize.s16,
}) {
  return _getTextStyle(
    fontSize,
    FontWight.extraLight,
    color,
  );
}
