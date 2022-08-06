import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:university_app/app/repositories/universityRepository.dart';

import '../services/universitiesService.dart';

class DependencyInjection {
  static void init() async {
    Get.lazyPut<Dio>(() => Dio(), fenix: true);
    Get.lazyPut<UniversityService>(() => UniversityService(), fenix: true);
    Get.lazyPut<UniversityRepository>(() => UniversityRepository(),
        fenix: true);
  }
}
