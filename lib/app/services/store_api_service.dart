import 'package:dio/dio.dart';

import '../models/store_data_model.dart';
import '../shared/constance.dart';

class StoreApiService {

  static final dio = Dio();

  ///// static dio package
 Future<List<Recipes>> fetchAllRecipes(String query) async {
    try {
      var response= await dio.get('https://forkify-api.herokuapp.com/api/search?q=$query');
      if(response.statusCode == 200){
        List<dynamic> storeList = response.data['recipes'];
        return storeList.map((item) => Recipes.fromJson(item)) .toList();
      }
    } catch (e) {
      print(e.toString());
    }throw'errrrrrrrrrrrrrrrrrrror';
  }
}
