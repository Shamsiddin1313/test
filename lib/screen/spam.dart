import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/comment_bloc.dart';
import 'package:test_app/screen/success.dart';
import 'package:test_app/theme/style.dart';

class SpamController extends StatefulWidget {
  const SpamController({super.key});

  @override
  State<SpamController> createState() => _SpamControllerState();
}

class _SpamControllerState extends State<SpamController> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void send() {
    context.read<CommentBloc>().add(SendCommentEvent(queryParams: {
          "to_user_id": 1,
          "category": "Спам",
          "text": commentController.text.trim()
        }));
    commentController.clear();
  }

  Widget get userImage => CircleAvatar(
      radius: 50,
      backgroundColor: Style.colors.lightGrey,
      child: Text("K",
          style: Style.headline4White.copyWith(color: Style.colors.black)));

  Widget get name => Text("Константин Володарский", style: Style.headline6);
  Widget get avatarAndName =>
      Column(children: [userImage, const SizedBox(height: 8), name]);

  Widget get title => Text("Спам", style: Style.subtitle1);

  Widget get desc => Text(
      "Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.",
      style: Style.caption);

  Widget get commentTitle =>
      Text("Комментарий (необязательно)", style: Style.captionGrey);
  Widget get field => SizedBox(
      height: 112,
      child: CupertinoTextField(
          controller: commentController,
          style: TextStyle(color: Style.colors.black)));

  Widget get button => GestureDetector(
        onTap: send,
        child: Container(
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Style.colors.blue),
            child: Center(
                child: Text("Отправить жалобу",
                    style: Style.caption.copyWith(color: Style.colors.white)))),
      );
  Widget get view => BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) => state is! SendedCommentState
          ? ListView(padding: Style.padding16, children: [
              avatarAndName,
              const SizedBox(height: 16),
              const Divider(height: 10),
              const SizedBox(height: 16),
              title,
              const SizedBox(height: 12),
              desc,
              const SizedBox(height: 12),
              commentTitle,
              const SizedBox(height: 8),
              field,
              const SizedBox(height: 16),
              button
            ])
          : const SuccessController());

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar:
          CupertinoNavigationBar(backgroundColor: Style.colors.white),
      child: SafeArea(child: view));
}
