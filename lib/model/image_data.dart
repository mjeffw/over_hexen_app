import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class ImageData with ChangeNotifier {
  String _name;
  String get name => _name ?? '';
  Uint8List _bytes;
  Uint8List get bytes => _bytes;

  bool _isEditingURL = false;
  bool get isEditingURL => _isEditingURL;
  set isEditingURL(bool isEditingURL) {
    _isEditingURL = isEditingURL;
    notifyListeners();
  }

  void updateState(String name, Uint8List bytes) {
    _name = name;
    _bytes = bytes;
    notifyListeners();
  }
}
