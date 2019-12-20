import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/image_data_provider.dart';
import '../providers/web/upload_file_image_data_provider.dart';
import 'file_viewer/file_viewer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FileImageDataProvider>(
            create: (_) => WebUploadFileImageDataProvider()),
        Provider<NetworkImageDataProvider>(
            create: (_) => NetworkImageDataProvider())
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.grey[100], Colors.grey[400]]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FileViewer(),
        ),
      ),
    );
  }
}
