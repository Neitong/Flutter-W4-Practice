import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  Icon _getStatusIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return Icon(Icons.download, color: AppColors.iconNormal);
      case DownloadStatus.downloading:
        return Icon(Icons.cloud_download, color: AppColors.iconNormal);
      case DownloadStatus.downloaded:
        return Icon(Icons.check_circle, color: AppColors.iconNormal);
    }
  }

  String _getProgressText(DownloadStatus status, double progress) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return '';
      case DownloadStatus.downloading:
        final percent = (progress * 100).toStringAsFixed(1);
        final downloadedSize = (controller.ressource.size * progress).toStringAsFixed(0);
        return '$percent % completed - $downloadedSize of ${controller.ressource.size} MB';
      case DownloadStatus.downloaded:
        return '100.0 % completed - ${controller.ressource.size}.0 of ${controller.ressource.size} MB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return GestureDetector(
          onTap: controller.status == DownloadStatus.notDownloaded
              ? () => controller.startDownload()
              : null,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.ressource.name,
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                    _getStatusIcon(controller.status),
                  ],
                ),
                if (controller.status == DownloadStatus.downloading) ...
                  [
                    SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: controller.progress,
                        minHeight: 4,
                        backgroundColor: AppColors.disabled,
                      ),
                    ),
                  ],
                SizedBox(height: 4),
                Text(
                  _getProgressText(controller.status, controller.progress),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
