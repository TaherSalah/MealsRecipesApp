import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/controller/store_data_controller.dart';
import 'app/views/home/home_views.dart';

void main() async {
  //// specialize init fast  Cached Image image it is required /////
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  runApp(ListenableProvider(
    create: (context) => RecipesController()..fetchAllRecipesMelon()..fetchAllRecipesPizza(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
