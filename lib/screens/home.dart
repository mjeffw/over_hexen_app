import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'file_viewer/file_viewer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: <Color>[Colors.grey[100], Colors.grey[400]]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FileViewer(),
      ),
    );
  }
}
