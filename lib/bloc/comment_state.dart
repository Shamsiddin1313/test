part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitialState extends CommentState {}

class LoadingCommentState extends CommentState {}

class SendedCommentState extends CommentState {}

class SendedCommentFailedState extends CommentState {
  final Exception? exception;

  SendedCommentFailedState({this.exception});

  bool get isRepositoryException => exception is RepositoryException;

  RepositoryException get repositoryException =>
      exception as RepositoryException;
}
