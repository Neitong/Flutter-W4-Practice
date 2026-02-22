import 'package:flutter/material.dart';
import 'package:w4_prqactice/services/color_service.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: ListenableBuilder(
        listenable: colorService,
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  colorService.tapCounts.entries
                      .map(
                        (entry) => Text(
                          '${entry.key.label} Taps: ${entry.value}',
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                      .toList(),
            ),
          );
        },
      ),
    );
  }
}
