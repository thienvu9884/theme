import 'package:equatable/equatable.dart';
import 'package:ktesst/model/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInit extends PostState {
  const PostInit();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostLoadSuccess extends PostState {
  final List<PostModel> post;
  const PostLoadSuccess({required this.post});

  @override
  List<Object?> get props => [post];
}

class PostLoadError extends PostState {
  final String? message;

  const PostLoadError({this.message});

  @override
  List<Object?> get props => [message];
}
