import 'package:get/get.dart';
import 'package:university_app/app/repositories/universityRepository.dart';

import '../../model/university.dart';

enum UniversitiesViewState { listView, gridView }
enum UniversitiesState { loading, ready, error }

class UniversitiesController extends GetxController {
  final repository = Get.find<UniversityRepository>();
  UniversitiesState univerisityState = UniversitiesState.loading;
  UniversitiesViewState viewState = UniversitiesViewState.listView;
  List<University> universities = [];

  onInit() {
    super.onInit();
    _getUniversities();
  }

  _getUniversities() {
    repository.getUniversities().then((value) {
      universities = value;
      univerisityState = UniversitiesState.ready;
      update();
    }).catchError((e) {
      univerisityState = UniversitiesState.error;
      update();
    });
  }

  changeView() {
    if (viewState == UniversitiesViewState.gridView) {
      viewState = UniversitiesViewState.listView;
    } else if (viewState == UniversitiesViewState.listView) {
      viewState = UniversitiesViewState.gridView;
    }
    update();
  }
}
