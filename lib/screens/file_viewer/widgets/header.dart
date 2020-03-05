import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/image_data.dart';
import '../../../providers/image_data_provider.dart';
import 'url_form.dart';

class Header extends StatelessWidget {
  Header({this.model});

  final ImageData model;

  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileImageDataProvider>(context);
    // final netProvider = Provider.of<NetworkImageDataProvider>(context);

    var text = Text(model.name);
    var urlForm = _urlForm();
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
      child: Row(
        // alignment: MainAxisAlignment.start,
        children: <Widget>[
          _uploadImageButton(fileProvider),
          _imageUrlButton(),
          Expanded(child: _createIndexedStack(text, urlForm)),
        ],
      ),
    );
  }

  Padding _createIndexedStack(Text text, Padding urlForm) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: IndexedStack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            text,
            urlForm,
          ],
          index: model.isEditingURL ? 1 : 0,
        ));
  }

  Padding _urlForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: UrlForm(onSubmit: (data, name) => model.updateState(name, data)),
    );
  }

  Padding _imageUrlButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: RaisedButton(
        onPressed: null, // () => model.isEditingURL = !model.isEditingURL,
        //netProvider.get((data, name) => model.updateState(name, data)),
        child: model.isEditingURL ? Text('Cancel') : Text('Image URL'),
        color: model.isEditingURL ? Colors.amber : Colors.lightGreen,
      ),
    );
  }

  Padding _uploadImageButton(FileImageDataProvider fileProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RaisedButton(
        onPressed: model.isEditingURL
            ? null
            : () =>
                fileProvider.get((data, name) => model.updateState(name, data)),
        child: Text('Upload Image'),
        color: Colors.lightGreen,
      ),
    );
  }
}
