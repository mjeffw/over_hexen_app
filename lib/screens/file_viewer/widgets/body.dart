import 'package:flutter/material.dart';

import '../../../model/image_data.dart';
import '../../../widgets/regexp_textfield.dart';
import 'hex_paint_controls_form.dart';

class Body extends StatelessWidget {
  final ImageData model;

  Body(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HexPaintControlsForm(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: image(),
        ),
      ],
    );
  }

  Widget hexPaintControlsForm(RegExInputFormatter _amountValidator) =>
      pixelsPerYard(_amountValidator);

  Widget image() => model.bytes != null
      ? Image.memory(model.bytes)
      : Container(color: Colors.transparent);

  Widget pixelsPerYard(RegExInputFormatter _amountValidator) => TextField(
      inputFormatters: [_amountValidator],
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ));
}
