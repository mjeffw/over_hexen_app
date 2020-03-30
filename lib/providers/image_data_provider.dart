import 'package:image/image.dart';

typedef ImageDataProviderHandler = void Function(Image data, String name);

abstract class ImageDataProvider {
  void get(ImageDataProviderHandler handler);
}

abstract class FileImageDataProvider extends ImageDataProvider {}

class NetworkImageDataProvider {
  void get(ImageDataProviderHandler handler) {}
}
