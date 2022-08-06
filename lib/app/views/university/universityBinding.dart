import 'package:get/get.dart';
import 'package:university_app/app/views/university/universityController.dart';

class UniversityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UniversityController());
  }
}
