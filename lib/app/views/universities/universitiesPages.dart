import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/app/routes/appRoutes.dart';
import 'package:university_app/app/views/universities/universitiesController.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities US'),
        actions: [
          GetBuilder<UniversitiesController>(
              builder: (_) => IconButton(
                  onPressed: _.changeView,
                  icon: Icon(_.viewState == UniversitiesViewState.gridView
                      ? Icons.list
                      : _.viewState == UniversitiesViewState.listView
                          ? Icons.grid_view
                          : Icons.error)))
        ],
      ),
      body: GetBuilder<UniversitiesController>(builder: (_) {
        if (_.univerisityState == UniversitiesState.ready) {
          if (_.viewState == UniversitiesViewState.listView) {
            return ListView.builder(
                itemCount: _.universities.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.UNIVERSITYDETAIL,
                          arguments: {"university": _.universities[index]});
                    },
                    child: ListTile(
                      leading: FadeInImage(
                        image: NetworkImage(_.universities[index].image),
                        placeholder:
                            const AssetImage("assets/images/placeholder.gif"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                        fit: BoxFit.contain,
                        width: 30,
                        height: 30,
                      ),
                      title: Text(_.universities[index].name),
                    ),
                  );
                });
          }

          if (_.viewState == UniversitiesViewState.gridView) {
            return GridView.builder(
                itemCount: _.universities.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FadeInImage(
                        image: NetworkImage(_.universities[index].image),
                        placeholder:
                            const AssetImage("assets/images/placeholder.gif"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                        fit: BoxFit.contain,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        _.universities[index].name,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  );
                });
          }
        }
        if (_.univerisityState == UniversitiesState.error) {
          return const Center(child: Text('Error get Universities'));
        }
        if (_.univerisityState == UniversitiesState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: Text('Error unknown'));
      }),
    );
  }
}
