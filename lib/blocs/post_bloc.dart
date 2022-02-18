import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktesst/blocs/post_event.dart';
import 'package:ktesst/blocs/post_state.dart';
import 'package:ktesst/service/api_call.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  ApiClient apiClient = ApiClient();

  PostBloc() : super(const PostInit()) {
    on<RequestGetPost>((event, emit) async {
      await _handleGetDataMovie(emit);
    });
  }

  _handleGetDataMovie(Emitter<PostState> emit) async {
    emit(const PostLoading());
    try {
      final listPost = await apiClient.getPostList();
      emit(PostLoadSuccess(post: listPost));
    } catch (e) {
      emit(PostLoadError(message: e.toString()));
    }
  }
}
