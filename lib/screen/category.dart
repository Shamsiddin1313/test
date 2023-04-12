import 'package:flutter/material.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/theme/style.dart';

class Category extends StatelessWidget {
  final CategoryModel categoryModel;
  final CategoryModel ontap;
  const Category({super.key, required this.categoryModel, required this.ontap});

  Widget get categoryName => GestureDetector(
        onTap: ontap.ontap,
        child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(categoryModel.name, style: Style.caption)),
      );

  @override
  Widget build(BuildContext context) => SafeArea(child: categoryName);
}
