import 'package:flutter/material.dart';
import 'package:w4_prqactice/services/color_service.dart';

class ColorTap extends StatelessWidget {
  final ColorType type;

  const ColorTap({
    super.key,
    required this.type,
  });

  Color get backgroundColor => type.color;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (context, child) {
        final tapCount = colorService.getTapCount(type);

        return GestureDetector(
          onTap: () => colorService.increment(type),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                '${type.label} Taps: $tapCount',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
