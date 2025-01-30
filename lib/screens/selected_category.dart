import 'package:flutter/material.dart';
import 'package:recipapp/models/selected_category.dart';
import 'package:recipapp/screens/category_details.dart';
import 'package:recipapp/widgets/category_item.dart';

class SelectedCategoryScreen extends StatelessWidget {
  const SelectedCategoryScreen({
    super.key,
    this.title,
    required this.selectedCategory,
    required this.onToggleFavorite,
  });
  final String? title;
  final List<Selectedcategory> selectedCategory;
  final void Function(Selectedcategory selectedcategory) onToggleFavorite;

  void selectCategory(BuildContext context, Selectedcategory selectedcategory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CategoryDetailsScreen(
          selectedcategory: selectedcategory,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh no ... nothing here! ',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (selectedCategory.isNotEmpty) {
      content = ListView.builder(
        itemCount: selectedCategory.length,
        itemBuilder: (ctx, index) => CategoryItem(
          selectedcategory: selectedCategory[index],
          onSelectedCategory: (selectedcategory) {
            selectCategory(
              context,
              selectedcategory,
            );
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
