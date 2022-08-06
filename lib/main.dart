import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/app/routes/appRoutes.dart';
import 'app/routes/appPages.dart';
import 'app/utils/dependencyInjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      title: 'Reciclapp',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.UNIVERSITY,
      getPages: AppPages.pages,
      locale: Locale("es"),
    );
  }
}
