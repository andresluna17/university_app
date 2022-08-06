import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:university_app/app/views/universities/universitiesBinding.dart';
import 'package:university_app/app/views/universities/universitiesPages.dart';
import 'package:university_app/app/views/university/universityBinding.dart';
import 'package:university_app/app/views/university/universityPages.dart';
import 'appRoutes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.UNIVERSITY,
        page: () => const UniversitiesPage(),
        binding: UniversitiesBinding()),
    GetPage(
        name: AppRoutes.UNIVERSITYDETAIL,
        page: () => const UniversityPage(),
        binding: UniversityBinding()),
  ];
}
