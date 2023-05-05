import 'package:flutter/material.dart';

import 'package:blog_posts/models/post.dart';
import 'package:blog_posts/screens/post_details.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final Function deletePost;
  final Function editPost;

  const PostsList(this.posts, this.deletePost, this.editPost, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (ctx, index) => InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetails(
              posts[index],
              deletePost,
              editPost,
            ),
          ),
        ),
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Center(child: Text(posts[index].title!)),
          ),
        ),
      ),
    );
  }
}
