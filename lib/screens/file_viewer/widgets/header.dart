import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/image_data.dart';
import '../../../providers/image_data_provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileImageDataProvider>(context);
    final model = Provider.of<ImageData>(context, listen: false);

    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
      ),
      child: ButtonBar(
        alignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: () => fileProvider.get((data) => model.bytes = data),
            child: Text('Upload Image'),
            color: Colors.amber,
          ),
//          RaisedButton(onPressed: () => urlProvider.get((data)=> Pro),),
        ],
      ),
    );
  }
}
