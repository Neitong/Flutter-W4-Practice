import 'package:flutter/material.dart';
import 'package:w4_prqactice/ui/screen/color_tab/color_tabs.dart';
import 'package:w4_prqactice/services/color_service.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: ListView(
        children: 
          ColorType.values.map((type) => ColorTap(type: type)).toList(),
      ),
    );
  }
}
