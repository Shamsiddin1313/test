part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class SendCommentEvent extends CommentEvent {
  final Map<String, dynamic> queryParams;
  SendCommentEvent({required this.queryParams});
}
