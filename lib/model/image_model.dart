import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class ImageModel with ChangeNotifier {
  Uint8List _bytes;
  Uint8List get bytes => _bytes;
  set bytes(Uint8List bytes) {
    _bytes = bytes;
    notifyListeners();
  }
}
