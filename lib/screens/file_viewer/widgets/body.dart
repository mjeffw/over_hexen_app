import 'package:flutter/material.dart';

import '../../../model/image_data.dart';
import 'hex_paint_controls_form.dart';

class Body extends StatelessWidget {
  final ImageData model;

  Body({this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HexPaintControlsForm(model: model),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _image(),
        ),
      ],
    );
  }

  Widget _image() => model.isLoaded
      ? Image.memory(model.bytes)
      : Container(color: Colors.transparent);
}
