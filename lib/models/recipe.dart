class Recipe {
  final String id;
  final String name;
  final String nameEn;
  final String description;
  final String descriptionEn;
  final String imagePath;
  final String category;
  final int prepTime;
  final int cookTime;
  final int servings;
  final String difficulty; // 'Facile' | 'Moyen' | 'Difficile'
  final List<String> ingredients;
  final List<String> ingredientsEn;
  final List<String> steps;
  final List<String> stepsEn;
  final NutritionInfo nutrition;

  const Recipe({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.description,
    required this.descriptionEn,
    required this.imagePath,
    required this.category,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.difficulty,
    required this.ingredients,
    required this.ingredientsEn,
    required this.steps,
    required this.stepsEn,
    required this.nutrition,
  });

  String localName(bool en) => en ? nameEn : name;
  String localDesc(bool en) => en ? descriptionEn : description;
  List<String> localIngredients(bool en) => en ? ingredientsEn : ingredients;
  List<String> localSteps(bool en) => en ? stepsEn : steps;
}

class NutritionInfo {
  final int calories;
  final double proteines;
  final double glucides;
  final double lipides;
  final double fibres;
  final Map<String, String> vitamines;

  const NutritionInfo({
    required this.calories,
    required this.proteines,
    required this.glucides,
    required this.lipides,
    required this.fibres,
    required this.vitamines,
  });
}

class Category {
  final String id;
  final String name;
  final String nameEn;
  final String icon;
  final String color; // hex sans #

  const Category({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.icon,
    required this.color,
  });

  String localName(bool en) => en ? nameEn : name;
}
