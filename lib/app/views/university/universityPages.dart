import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_app/app/views/university/universityController.dart';

class UniversityPage extends StatelessWidget {
  const UniversityPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return GetBuilder<UniversityController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(_.university.name),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: _.university.imageLocal
                  ? FadeInImage(
                      image: FileImage(File(_.university.image)),
                      placeholder:
                          const AssetImage("assets/images/placeholder.gif"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                      fit: BoxFit.contain,
                      width: 30,
                      height: 30,
                    )
                  : FadeInImage(
                      image: NetworkImage(_.university.image),
                      placeholder:
                          const AssetImage("assets/images/placeholder.gif"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                      fit: BoxFit.contain,
                      width: 30,
                      height: 30,
                    ),
            ),
            const SizedBox(height: 50),
            const Text('Web-Site'),
            ..._.university.webPages.map((e) => Text(e)).toList(),
            const SizedBox(height: 50),
            TextButton(
                onPressed: () => _.getImage(ImageSource.gallery),
                child: const Text('select photo from to gallery')),
            TextButton(
                onPressed: () => _.getImage(ImageSource.camera),
                child: const Text('select photo from to camera')),
          ],
        ),
      ),
    );
  }
}
