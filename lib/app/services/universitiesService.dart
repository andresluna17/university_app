import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:university_app/app/model/university.dart';

class UniversityService {
  final dio = Get.find<Dio>();
  final url =
      'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json';

  Future<List<University>> getUniversities() async {
    final response = await dio.get(url);
    return (response.data as List).map((x) => University.fromJson(x)).toList();
  }
}
