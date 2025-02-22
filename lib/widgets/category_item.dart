import 'package:flutter/material.dart';
import 'package:recipapp/models/selected_category.dart';
import 'package:recipapp/widgets/category_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.selectedcategory,
    required this.onSelectedCategory,
  });
  final Selectedcategory selectedcategory;

  final void Function(Selectedcategory selectedcategory) onSelectedCategory;

  String get complexityText {
    return selectedcategory.complexity.name[0].toUpperCase() +
        selectedcategory.complexity.name.substring(1);
  }

  String get affordabilityText {
    return selectedcategory.affordability.name[0].toUpperCase() +
        selectedcategory.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectedCategory(selectedcategory);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(selectedcategory.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Column(
                  children: [
                    Text(
                      selectedcategory.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CategoryItemTrait(
                          icon: Icons.schedule,
                          label: '${selectedcategory.duration} min',
                        ),
                        const SizedBox(width: 12),
                        CategoryItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        CategoryItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
