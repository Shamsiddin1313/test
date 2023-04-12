import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/size_config.dart';
import 'package:test_app/theme/style.dart';

class SuccessController extends StatefulWidget {
  const SuccessController({super.key});

  @override
  State<SuccessController> createState() => _SuccessControllerState();
}

class _SuccessControllerState extends State<SuccessController> {
  Widget get userImage => CircleAvatar(
      radius: 50,
      backgroundColor: Style.colors.lightGrey,
      child: Text("K",
          style: Style.headline4White.copyWith(color: Style.colors.black)));

  Widget get name => Text("Константин Володарский", style: Style.headline6);
  Widget get avatarAndName =>
      Column(children: [userImage, const SizedBox(height: 8), name]);

  Widget get title => Center(child: Text("Спасибо!", style: Style.subtitle1));

  Widget get desc => Center(
      child: Text("Модераторы скоро рассмотрят вашу жалобу.",
          style: Style.caption));

  Widget get button => GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Style.colors.blue),
            child: Center(
                child: Text("Закрыть",
                    style: Style.caption.copyWith(color: Style.colors.white)))),
      );
  Widget get view => ListView(padding: Style.padding16, children: [
        avatarAndName,
        SizedBox(height: SizeConfig.screenHeight / 4),
        title,
        desc,
        const SizedBox(height: 24),
        button
      ]);

  @override
  Widget build(BuildContext context) => SafeArea(child: view);
}
