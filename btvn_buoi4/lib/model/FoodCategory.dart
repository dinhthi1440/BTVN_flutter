import 'Food.dart';

class FoodCategory{
  final int id;
  final String name;
  final List<Food> listFood;

  FoodCategory({required this.id, required this.name, required this.listFood});
}