import 'package:flutter/material.dart';
import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widgets/download_controler.dart';
// import 'package:w4_prqactice/service/theme_color_service.dart';
import 'widgets/download_tile.dart';


class DownloadsScreen extends StatelessWidget {
  // Create the list of fake ressources
  final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image2.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
    //=================================
    //Add more ressources to testing
    //=================================
    Ressource(name: "Ronan_is_god.png", size: 120),
  ];

  final List<DownloadController> controllers = [];

  DownloadsScreen({super.key}) {
    // Create a controllers for each ressource
    for (Ressource ressource in ressources) {
      controllers.add(DownloadController(ressource));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeColorService,
      builder: (context, child) {
        return Container(
          color: themeColorService.currentThemeColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                "Downloads",
                style: AppTextStyles.heading.copyWith(
                  color: themeColorService.currentThemeColor.color,
                ),
              ),

              SizedBox(height: 50),

              Expanded(
                child: ListView(
                  children: controllers.map((controller) => DownloadTile(controller: controller))
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
