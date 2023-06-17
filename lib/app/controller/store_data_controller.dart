import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/store_data_model.dart';
import '../services/store_api_service.dart';

class RecipesController extends ChangeNotifier {
  StoreApiService service = StoreApiService();
  List <Recipes> recipesControllerList = [];
  bool isLoading = false;

  Future<void> fetchAllRecipesMelon() async {
    isLoading = true;
    notifyListeners();
    recipesControllerList = await service.fetchAllRecipes('melon');
    isLoading = false;
    notifyListeners();
  }

  Future<void>fetchAllRecipesPizza()async{
    isLoading=true;
    notifyListeners();
    recipesControllerList=await service.fetchAllRecipes('pizza');
  }

  /////  open Launch Url external page /////

  Future<void> openLaunchUrl(String url) async {
    final Uri uri=Uri.parse(url);
    if (!await launchUrl(
      uri,mode:LaunchMode.externalApplication,

    )) {
      throw Exception('Could not launch $url');
    }
    notifyListeners();

}}
