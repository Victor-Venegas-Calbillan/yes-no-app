import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> colorThemes = [
  _customColor,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(
          selectedColor >= 0 && selectedColor < colorThemes.length,
          'selectedColor must be between 0 and ${colorThemes.length - 1}',
        );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
    );
  }
}
