import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipapp/models/selected_category.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Selectedcategory>> {
  FavoriteMealsNotifier() : super([]);
  bool toggleMealFavoriteStatus(Selectedcategory selectedcategory) {
    final mealIsFavorite = state.contains(selectedcategory);

    if (mealIsFavorite) {
      state = state.where((s) => s.id != selectedcategory.id).toList();
      return false;
    } else {
      state = [...state, selectedcategory];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Selectedcategory>>((ref) {
  return FavoriteMealsNotifier();
});
