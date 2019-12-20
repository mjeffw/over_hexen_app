import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/image_data.dart';
import '../../../providers/image_data_provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageDataProvider provider = Provider.of<ImageDataProvider>(context);
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
              provider.get((data) =>
                      Provider.of<ImageData>(context, listen: false).bytes =
                          data);
            },
            child: Text('Load Image'),
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
