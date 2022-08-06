import 'package:get/get.dart';
import 'package:university_app/app/model/university.dart';
import 'package:university_app/app/services/universitiesService.dart';

class UniversityRepository {
  Future<List<University>> getUniversities() {
    final repository = Get.find<UniversityService>();
    return repository.getUniversities();
  }
}
