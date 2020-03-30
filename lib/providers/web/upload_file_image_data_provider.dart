import 'package:image/image.dart';
import 'package:universal_html/prefer_universal/html.dart';

import '../image_data_provider.dart';

class WebUploadFileImageDataProvider extends FileImageDataProvider {
  @override
  void get(ImageDataProviderHandler handler) {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        print(file.name);
        final reader = new FileReader();

        reader.onLoadEnd.listen((e) {
          Image image = decodeImage(reader.result);
          handler(image, file.name);
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }
}
