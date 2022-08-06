import 'package:get/get.dart';
import 'package:university_app/app/views/universities/universitiesController.dart';

class UniversitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UniversitiesController());
  }
}
