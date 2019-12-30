import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/image_data.dart';
import '../../../providers/image_data_provider.dart';
import 'url_form.dart';

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
                    child: UrlForm(
                        onSubmit: (data, name) =>
                            model.updateState(name, data)),
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
