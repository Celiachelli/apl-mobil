
import 'package:flutter_app/recipe.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RecipeBox {
  static final RecipeBox instance = RecipeBox();
  static Box box;

  static void init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RecipeAdapter());
    box = await Hive.openBox("recipeBox");
    var values = box.values;
    if (values == null || values.isEmpty) {
      RecipeBox.box.putAll(Map.fromIterable(recipes, key: (e) => e.key(), value: (e) => e));
    }
  }

  static final List<Recipe> recipes = [ Recipe(
      "Pizza facile",
      "Par David Silvera",
      "FOND_01.png",
      "ihzefihzeiofhzefih",
      false,
      50),
    Recipe(
        "Burger maison",
        "Par Cyril Lignac",
        "FOND_01.png",
        "Pelez l’oignon rouge puis émincez-le. Rincez et essorez la roquette. Rincez la tomate puis coupez-la en rondelles.\nFaites chauffer l’huile dans une poêle et faites cuire les steaks 3 à 4 min de chaque côté, selon votre goût. En fin de cuisson, salez, poivrez, disposez 1 tranche de cheddar sur chaque steak et laissez-la légèrement fondre.\nFendez les petits pains en 2 et toastez-les légèrement. Montez les burgers : tartinez chaque moitié de pain de sauce puis garnissez avec la viande, les rondelles de tomate, l’oignon ciselé et les feuilles de roquette. Refermez les burgers et servez aussitôt.",
        true,
        33),

  ];
}