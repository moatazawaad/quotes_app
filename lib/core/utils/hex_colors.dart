import 'dart:ui';

class HexColors extends Color {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColors(final String hexColor) : super(getColorFromHex(hexColor));
}

/// example primaryColor: HexColors('#7F00FF')
/// or make ordinary hex color by get it from google then Color(0xff then the code without #
/// example   static const Color violet = Color(0xff7F00FF);
