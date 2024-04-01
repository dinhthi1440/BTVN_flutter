class Food{
  final int id;
  final String image;
  final String titleName;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> categories;
  final int timeCook;

  Food({required this.id, required this.image, required this.titleName,
    required this.ingredients, required this.steps, required this.categories,
    required this.timeCook});

}