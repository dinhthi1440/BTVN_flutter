import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'data.dart';

class CartProvider with ChangeNotifier, DiagnosticableTreeMixin{
  List<int> foodIDSelected = [];
  Set<Food> listFood = Set<Food>();
  int totalQuantity=0;
  int totalMoney = 0;
  void updateQuantity(Food food, String plusOrMinus){
    if(plusOrMinus=="plus"){
      foodIDSelected.add(food.id);
      totalQuantity++;
      listFood.add(food);
      totalMoney += FoodData.listFoods.firstWhere((element) => element.id == food.id).cost;
    }else{
      foodIDSelected.remove(food.id);
      totalQuantity--;
      if(getQuantity(food.id) == 0){
        listFood.remove(food);
      }
      totalMoney -= FoodData.listFoods.firstWhere((element) => element.id == food.id).cost;
    }
    notifyListeners();
  }

  int getQuantity(int foodID){
    int totalQuantity = 0;
    for (int itemID in foodIDSelected) {
      if (itemID== foodID) {
        totalQuantity += 1;
      }
    }
    notifyListeners();
    return totalQuantity;
  }
  void clearAll(){
    foodIDSelected.clear();
    print(foodIDSelected);
    totalQuantity=0;
    totalMoney = 0;
    listFood.clear();
    notifyListeners();
  }
}
