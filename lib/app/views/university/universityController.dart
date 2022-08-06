import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_app/app/model/university.dart';

enum UniversityState { loading, error, ready }

class UniversityController extends GetxController {
  University university = Get.arguments['university'] as University;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      university.imageLocal = true;
      university.image = pickedImage.path;
    }
    update();
  }
}
