import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url/url.dart';

import '../../../providers/image_data_provider.dart';

class UrlForm extends StatefulWidget {
  final ImageDataProviderHandler onSubmit;

  UrlForm({this.onSubmit});

  @override
  State<StatefulWidget> createState() {
    return UrlFormState();
  }
}

final Color _invalidColor = Colors.red[800];
final Color _validColor = Colors.black;

class UrlFormState extends State<UrlForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  var _validUrl = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listen);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration:
                  InputDecoration(hintText: 'URL of image', isDense: true),
              style: TextStyle(
                backgroundColor: Colors.blueGrey[100],
                color: _validUrl ? _validColor : _invalidColor,
              ),
              validator: validate,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RaisedButton(
              color: Colors.lightGreen,
              onPressed: () {
                if (_formKey.currentState.validate()) _submit(context);
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Loading Image...'),
    ));

    // TODO update
    String text = _controller.text;
    Uri uri = Uri.parse(text);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      widget.onSubmit(response.bodyBytes, text);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text('Error loading image from network: ${response.statusCode}'),
        backgroundColor: Colors.red,
      ));
    }
  }

  String validate(value) {
    if (value.isEmpty) return 'Enter an image URL';
    if (!_isValidImageURL(value)) return 'Enter a valid URL';

    return null;
  }

  void _listen() {
    if (_validUrl != _isValidImageURL(_controller.text)) {
      setState(() {
        _validUrl = !_validUrl;
      });
    }
  }

  bool _isValidImageURL(String text) =>
      isUrl(text) && !Url.parse(text).hasEmptyPath;
}
