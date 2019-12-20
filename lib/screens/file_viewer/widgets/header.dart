import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import '../../../model/image_data.dart';

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
    Provider.of<ImageData>(context, listen: false).bytes = result;
  }
}
