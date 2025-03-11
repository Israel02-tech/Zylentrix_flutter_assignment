import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../models/post.dart';

//Service class to handle API requests with comprehensive error handling.
class ApiService {
  // API endpoint URL.
  static const String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  /// Fetching the list of posts from the API.
  Future<List<Post>> fetchPosts() async {
    try {
      // Setting a timeout duration to catch slow responses.
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw HttpException(
            'Failed to load posts (Status Code: ${response.statusCode})');
      }
    } on SocketException {
      throw SocketException(
          'No Internet connection. Please check your network settings.');
    } on TimeoutException {
      throw TimeoutException(
          'The connection has timed out. Please try again later.');
    } on FormatException {
      throw FormatException(
          'Bad response format. Please contact support.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
