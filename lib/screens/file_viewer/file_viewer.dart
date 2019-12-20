import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/image_data.dart';
import 'widgets/body.dart';
import 'widgets/header.dart';

class FileViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageData(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            Consumer<ImageData>(builder: (_, image, __) => Body(image)),
          ],
        ),
      ),
    );
  }
}
