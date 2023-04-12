import 'package:flutter/material.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/routes/route.dart';
import 'package:test_app/screen/category.dart';
import 'package:test_app/theme/style.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List get category => [
        CategoryModel(
            name: "Спам",
            ontap: () {
              Navigator.of(context).pushNamed(AppRoutes.spam);
            }),
        CategoryModel(name: "Мошенничество", ontap: () {}),
        CategoryModel(name: "Оскорбления", ontap: () {}),
        CategoryModel(name: "Откровенное изображение", ontap: () {}),
        CategoryModel(name: "Проблема с профилем", ontap: () {}),
        CategoryModel(name: "Нарушение интеллектуальных прав", ontap: () {}),
        CategoryModel(name: "Прочее", ontap: () {})
      ];

  Widget get userImage => CircleAvatar(
      radius: 50,
      backgroundColor: Style.colors.lightGrey,
      child: Text("K",
          style: Style.headline4White.copyWith(color: Style.colors.black)));

  Widget get name => Text("Константин Володарский", style: Style.headline6);

  Widget get title => Padding(
      padding: Style.padding16,
      child: Text("Что на странице Контантина кажется вам недопустимым?",
          style: Style.subtitle1));

  Widget get avatarAndName =>
      Column(children: [userImage, const SizedBox(height: 8), name]);

  Widget get categories => ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (_, index) =>
          Category(categoryModel: category[index], ontap: category[index]));

  Widget get view => Column(children: [
        avatarAndName,
        const SizedBox(height: 16),
        const Divider(height: 10),
        title,
        Expanded(child: categories)
      ]);

  @override
  Widget build(BuildContext context) => SafeArea(child: view);
}
