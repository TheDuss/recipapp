import 'package:flutter/material.dart';
import 'package:recipapp/data/dummy_data.dart';
import 'package:recipapp/models/category.dart';
import 'package:recipapp/models/selected_category.dart';
import 'package:recipapp/screens/selected_category.dart';
import 'package:recipapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Selectedcategory selectedcategory) onToggleFavorite;
  final List<Selectedcategory> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredCategory = availableMeals
        .where((selectedcategory) =>
            selectedcategory.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SelectedCategoryScreen(
          title: category.title,
          selectedCategory: filteredCategory,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
