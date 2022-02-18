import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetPost extends PostEvent {
  const RequestGetPost();

  @override
  List<Object?> get props => [];
}