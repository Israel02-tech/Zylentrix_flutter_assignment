import 'package:equatable/equatable.dart';

/// Abstract class representing Post events.
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch posts from the API.
class FetchPosts extends PostEvent {}
