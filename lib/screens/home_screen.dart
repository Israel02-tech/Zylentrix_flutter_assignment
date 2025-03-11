import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zylentirx_fluttter_assignment/bloc/post_event.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 62, 197),
        titleSpacing: 18,
        title: Text(
          "Posts",
          style: GoogleFonts.josefinSans(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            // Show a loading indicator while posts are being fetched from the API.
            return Center(
                child: CircularProgressIndicator(
              color: const Color.fromARGB(255, 0, 62, 197),
            ));
          } else if (state is PostLoaded) {
            final posts = state.posts;
            // Displaying the list of posts in a scrollable ListView and putting the Posts in Cards.
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  surfaceTintColor: const Color.fromARGB(255, 170, 197, 255),
                  shadowColor: const Color.fromARGB(255, 0, 62, 197),
                  color: Colors.white,
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // The Post Title
                        Text(
                          post.title,
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 62, 197),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        // The Post body
                        Text(
                          post.body,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PostError) {
            // Displaying an error message incase any error occurs
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.josefinSans(
                        fontStyle: FontStyle.italic,
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Created an Try again button that prompts the user to try again incase of any error
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 62, 197),
                        elevation: 4,
                        shadowColor: const Color.fromARGB(255, 0, 62, 197),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Initializing
                        context.read<PostBloc>().add(FetchPosts());
                      },
                      child: Text(
                        'Try Again',
                        style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Fallback UI for the initial state.
            return Center(
              child: Text(
                "Please wait...",
                style: GoogleFonts.roboto(),
              ),
            );
          }
        },
      ),
    );
  }
}
