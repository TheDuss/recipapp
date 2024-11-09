import 'package:flutter/material.dart';
import 'package:recipapp/models/selected_category.dart';

class SelectedRecipeScreen extends StatelessWidget {
  const SelectedRecipeScreen(
      {super.key, required this.title, required this.selectedCategory});
  final String title;
  final List<Selectedcategory> selectedCategory;
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
        itemBuilder: (ctx, index) => Text(
          selectedCategory[index].title,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
