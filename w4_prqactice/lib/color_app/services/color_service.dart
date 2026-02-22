import 'package:flutter/material.dart';

enum ColorType {
  red(label: 'Red', color: Colors.red),
  blue(label: 'Blue', color: Colors.blue),
  //==========================================
  // Be able to add more colors here
  //==========================================
  green(label: 'Green', color: Colors.green);

  const ColorType({required this.label, required this.color});

  final String label;
  final Color color;
}

class ColorService extends ChangeNotifier {
  final Map<ColorType, int> _tapCounts = {
    for (final type in ColorType.values) type: 0,
  };

  Map<ColorType, int> get tapCounts => Map.unmodifiable(_tapCounts);

  int getTapCount(ColorType type) => _tapCounts[type] ?? 0;

  void increment(ColorType type) {
    _tapCounts[type] = getTapCount(type) + 1;
    notifyListeners();
  }
}

final ColorService colorService = ColorService();