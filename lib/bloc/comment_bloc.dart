import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/repository/comment.dart';
import 'package:test_app/repository/exception.dart';
import 'package:http/http.dart' as http;

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final http.Client _client = http.Client();

  CommentBloc() : super(CommentInitialState()) {
    on<SendCommentEvent>((event, emit) async {
      emit(LoadingCommentState());
      try {
        await CommentRepository.comment(_client, event.queryParams);
        emit(SendedCommentState());
      } on Exception catch (e) {
        emit(SendedCommentFailedState(exception: e));
      }
    });
  }
}
