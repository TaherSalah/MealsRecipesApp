
class RecipesApisModel {
  List<Recipes>? recipes;

  RecipesApisModel({this.recipes});

  RecipesApisModel.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null)
    {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
  }

}

class Recipes {
  String? publisher;
  String? title;
  String? sourceUrl;
  String? recipeId;
  String? imageUrl;
  num? socialRank;
  String? publisherUrl;

  Recipes({
    this.publisher,
    this.title,
    this.sourceUrl,
    this.recipeId,
    this.imageUrl,
    this.socialRank,
    this.publisherUrl});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      publisher: json['publisher'],
      title: json['title'],
      sourceUrl: json['source_url'],
      recipeId: json['recipe_id'],
      imageUrl: json['image_url']??'',
      socialRank: json['social_rank'],
      publisherUrl: json['publisher_url'],
    );
  }

}

