import 'package:flutter/material.dart';
import 'package:recipapp/data/dummy_data.dart';
import 'package:recipapp/models/category.dart';
import 'package:recipapp/screens/selected_recipe.dart';
import 'package:recipapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredCategory = dummySelectedcategory
        .where((selectedcategory) =>
            selectedcategory.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SelectedRecipeScreen(
          title: category.title,
          selectedCategory: filteredCategory,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select category'),
      ),
      body: GridView(
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
      ),
    );
  }
}
