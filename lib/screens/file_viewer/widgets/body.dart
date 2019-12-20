import 'package:flutter/material.dart';

import '../../../model/image_data.dart';

class Body extends StatelessWidget {
  final ImageData model;

  Body(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 600,
      color: Colors.blueGrey,
      child: model.bytes != null
          ? Image.memory(model.bytes)
          : Container(color: Colors.transparent),
    );
  }
}
