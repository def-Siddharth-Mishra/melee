import 'package:meals_app/models/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleFavoriteMealsStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final FavoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifier();
  },
);
