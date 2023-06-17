import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/store_data_controller.dart';
import '../../shared/constance.dart';
import '../details/details_views.dart';

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
                    child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.recipesControllerList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final storeItemList =
                          controller.recipesControllerList[index];
                      return Hero(
                        tag: heroTag,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipesDetails(recipes: storeItemList),
                                ));
                          },
                          child: Card(
                            elevation: 8,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10)),
                                  Expanded(
                                    child: Center(
                                      child: FastCachedImage(
                                        url: '${storeItemList.imageUrl}',
                                        fit: BoxFit.cover,
                                        height: 400,
                                        width: 400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${storeItemList.title}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.cairo(
                                        fontSize: 13, color: Colors.green),
                                  ),
                                  Text(
                                    '${storeItemList.publisher}',
                                    style: GoogleFonts.cairo(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate,
                                        color: Colors.amberAccent,
                                      ),
                                      Text(
                                          '${storeItemList.socialRank!.toInt()}%')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ))
          ],
        ));
  }
}
