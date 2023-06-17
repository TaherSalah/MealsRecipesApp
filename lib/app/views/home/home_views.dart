import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/store_data_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RecipesController>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(controller.isLoading ? 'loading........' : 'Store App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final storeItemList =
                              controller.recipesControllerList[index
                              ];

                          return GestureDetector(
                            onTap: () async{
                              controller.openLaunchUrl('${storeItemList.sourceUrl}');
                            },
                            child: Card(
                              child: ListTile(
                                leading:ClipRRect(
clipBehavior: Clip.antiAliasWithSaveLayer
                                  ,
                                  borderRadius: BorderRadius.circular(10),
                                  child: FastCachedImage(url:'${storeItemList.imageUrl}',),
                                ) ,
                                title: Text('${storeItemList.title}'),
                                subtitle: Row(children: [
                                  Expanded(child: Text('${storeItemList.publisher}')),
                                  // Expanded(child: Text('${storeItemList.socialRank}')),
                                ],),
                                trailing: IconButton(onPressed: () {

                                  controller.openLaunchUrl('${storeItemList.publisherUrl}');

                                }, icon: Icon(Icons.source_outlined)),
                                // leading: Text('${storeItemList.title}'),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: controller.recipesControllerList.length)),
          ],
        ));
  }
}
