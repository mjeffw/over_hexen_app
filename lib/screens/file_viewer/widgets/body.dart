import 'package:flutter/material.dart';

import '../../../model/image_data.dart';
import '../../../widgets/regexp_textfield.dart';

class Body extends StatelessWidget {
  final ImageData model;

  Body(this.model);

  @override
  Widget build(BuildContext context) {
    final _amountValidator = RegExInputFormatter.withRegex(
        '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: scaleInput(_amountValidator)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: image(),
        ),
      ],
    );
  }

  Widget image() => model.bytes != null
      ? Image.memory(model.bytes)
      : Container(color: Colors.transparent);

  Widget scaleInput(RegExInputFormatter _amountValidator) => TextField(
      inputFormatters: [_amountValidator],
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ));
}
