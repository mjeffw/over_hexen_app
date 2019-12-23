import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url/url.dart';

import '../../../model/image_data.dart';
import '../../../providers/image_data_provider.dart';

class Header extends StatelessWidget {
  final ImageData model;

  Header({this.model});

  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileImageDataProvider>(context);
    // final netProvider = Provider.of<NetworkImageDataProvider>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
      ),
      child: Row(
        // alignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RaisedButton(
              onPressed: model.isEditingURL
                  ? null
                  : () => fileProvider
                      .get((data, name) => model.updateState(name, data)),
              child: Text('Upload Image'),
              color: Colors.lightGreen,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RaisedButton(
              onPressed: () => model.isEditingURL = !model.isEditingURL,
              //netProvider.get((data, name) => model.updateState(name, data)),
              child: model.isEditingURL ? Text('Cancel') : Text('Image URL'),
              color: model.isEditingURL ? Colors.amber : Colors.lightGreen,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IndexedStack(
                alignment: AlignmentDirectional.centerStart,
                children: <Widget>[
                  Text(model.name),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: UrlForm(),
                  ),
                ],
                index: model.isEditingURL ? 1 : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UrlForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UrlFormState();
  }
}

class UrlFormState extends State<UrlForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final Color _invalidColor = Colors.red[800];
  final Color _validColor = Colors.black;
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
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Loading Image...'),
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  String validate(value) {
    if (value.isEmpty) return 'Enter an image URL';
    if (!isUrl(value)) return 'Enter a valid image URL';
    return null;
  }

  void _listen() {
    bool valid =
        isUrl(_controller.text) && !Url.parse(_controller.text).hasEmptyPath;

    if (_validUrl != valid) {
      setState(() {
        _validUrl = valid;
      });
    }
  }
}
