import 'dart:typed_data';

typedef ImageDataProviderHandler = void Function(Uint8List data, String name);

abstract class ImageDataProvider {
  void get(ImageDataProviderHandler handler);
}

abstract class FileImageDataProvider extends ImageDataProvider {}

class NetworkImageDataProvider {
  void get(ImageDataProviderHandler handler) {}
}
