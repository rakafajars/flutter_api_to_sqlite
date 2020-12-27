import 'dart:convert';

DataMeal dataMealFromJson(String str) => DataMeal.fromJson(json.decode(str));

String dataMealToJson(DataMeal data) => json.encode(data.toJson());

class DataMeal {
  List<Category> categories;

  DataMeal({
    this.categories,
  });

  factory DataMeal.fromJson(Map<String, dynamic> json) => DataMeal(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
