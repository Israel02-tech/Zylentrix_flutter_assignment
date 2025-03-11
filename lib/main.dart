import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_event.dart';

void main() {
  runApp(MyApp());
}

/// Root widget for the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Making the PostBloc available to the entire app.
    return BlocProvider(
      create: (context) => PostBloc()..add(FetchPosts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter API Fetching with Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
