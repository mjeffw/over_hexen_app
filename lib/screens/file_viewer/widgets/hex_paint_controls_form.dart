import 'package:flutter/material.dart';
import '../../../widgets/regexp_textfield.dart';

class HexPaintControlsForm extends StatefulWidget {
  @override
  _HexPaintControlsFormState createState() => _HexPaintControlsFormState();
}

class _HexPaintControlsFormState extends State<HexPaintControlsForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController(text: '20.0');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _controller.addListener(_listen);
  }

  @override
  Widget build(BuildContext context) {
    final _amountValidator = RegExInputFormatter.withRegex(
        '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 80.0,
            child: TextField(
              controller: _controller,
              inputFormatters: [_amountValidator],
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              decoration: InputDecoration(labelText: 'Pixels/yard'),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: RaisedButton(
            onPressed: () => {},
            child: Text('Draw'),
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
