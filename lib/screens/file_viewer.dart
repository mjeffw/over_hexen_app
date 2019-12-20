import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import '../model/image_model.dart';

class FileViewer extends StatelessWidget {
  const FileViewer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageModel(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            Consumer<ImageModel>(builder: (_, image, __) => Body(image)),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
      ),
      child: ButtonBar(
        alignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              selectFile(context);
            },
            child: Text('Load Image'),
            color: Colors.amber,
          )
        ],
      ),
    );
  }

  void selectFile(BuildContext context) async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        final reader = new html.FileReader();

        reader.onLoadEnd.listen((e) {
          _handleResult(context, reader.result);
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }

  void _handleResult(BuildContext context, Uint8List result) {
    Provider.of<ImageModel>(context, listen: false).bytes = result;
  }
}

class Body extends StatelessWidget {
  final ImageModel model;

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
