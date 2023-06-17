import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import '../../controller/store_data_controller.dart';
import '../../models/store_data_model.dart';
import '../../shared/constance.dart';
import '../home/home_views.dart';

class RecipesDetails extends StatefulWidget {
  Recipes recipes = Recipes();

  RecipesDetails({super.key, required this.recipes});

  @override
  State<RecipesDetails> createState() => _RecipesDetailsState();
}

class _RecipesDetailsState extends State<RecipesDetails> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RecipesController>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Hero(
            tag: heroTag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      FastCachedImage(
                        url: '${widget.recipes.imageUrl}',
                        fit: BoxFit.cover,
                        height: 600,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();

                            },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      '${widget.recipes.title}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.cairo(fontSize: 25, color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.recipes.publisher}',
                    style: GoogleFonts.cairo(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'social Rank',
                        style:
                            GoogleFonts.cairo(fontSize: 20, color: Colors.grey),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width / 2,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.9,
                          center: Text(
                            "${widget.recipes.socialRank!.toInt()} %",
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller
                              .openLaunchUrl('${widget.recipes.publisherUrl}');
                        },
                        child: Text(
                          'publisher',
                          style: GoogleFonts.mukta(
                              fontSize: 15, color: Colors.black),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          controller.openLaunchUrl('${widget.recipes.sourceUrl}');
                        },
                        child: Text(
                          'Source',
                          style: GoogleFonts.mukta(
                              fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
