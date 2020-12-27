import 'package:http/http.dart';
import 'package:sqlite_flutter/model/meals.dart';
import 'package:sqlite_flutter/provider/database_provider.dart';

class MealApiProvider {
  Future<void> getAllMeal() async {
    var url = "https://www.themealdb.com/api/json/v1/1/categories.php";
    Response response = await get(url);
    DataMeal dataMeal = dataMealFromJson(response.body);
    for (Category category in dataMeal.categories) {
      DBProvider.db.insertMeals(category);
    }
  }

  String b = "sa";

  int a(){
    return 9;
  }

}
