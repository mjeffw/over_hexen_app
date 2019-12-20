import 'package:universal_html/prefer_universal/html.dart';

import '../image_data_provider.dart';

class WebUploadFileImageDataProvider extends ImageDataProvider {
  @override
  void get(ImageDataProviderHandler handler) {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        final reader = new FileReader();

        reader.onLoadEnd.listen((e) {
          handler(reader.result);
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }
}
