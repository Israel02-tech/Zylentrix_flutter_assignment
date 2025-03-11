import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import 'dart:async';

import '../models/post.dart';
import '../services/api_service.dart';
import 'post_event.dart';
import 'post_state.dart';

/// Bloc to manage fetching posts with detailed error handling.
class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService _apiService = ApiService();

  PostBloc() : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());

      // Check for connectivity before making the API call.
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(PostError(
            "No Internet connection. Please check your network settings and try again."));
        return;
      }

      try {
        final List<Post> posts = await _apiService.fetchPosts();
        emit(PostLoaded(posts));
      } on SocketException {
        emit(PostError(
            'No Internet connection. Please check your network settings.'));
      } on TimeoutException {
        emit(
            PostError('The connection has timed out. Please try again later.'));
      } on FormatException {
        emit(PostError('Bad response format. Please contact support.'));
      } on HttpException catch (e) {
        emit(PostError(e.message));
      } catch (e) {
        emit(PostError('An unexpected error occurred: $e'));
      }
    });
  }
}
