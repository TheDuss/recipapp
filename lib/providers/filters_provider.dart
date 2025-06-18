import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipapp/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((selectedcategory) {
    if (activeFilters[Filter.glutenFree]! && !selectedcategory.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !selectedcategory.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !selectedcategory.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !selectedcategory.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
