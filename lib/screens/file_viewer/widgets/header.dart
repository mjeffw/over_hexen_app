import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              onPressed: () => fileProvider
                  .get((data, name) => model.updateState(name, data)),
              child: Text('Upload Image'),
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RaisedButton(
              onPressed: () => model.isEditingURL = !model.isEditingURL,
              //netProvider.get((data, name) => model.updateState(name, data)),
              child: Text('Image URL'),
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IndexedStack(
                alignment: AlignmentDirectional.centerStart,
                children: <Widget>[
                  Text(model.name),
                  UrlForm(),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) return 'Enter an image URL';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RaisedButton(
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
}
