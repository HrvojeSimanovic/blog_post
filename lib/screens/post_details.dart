import 'package:flutter/material.dart';

import 'package:blog_posts/models/post.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  final Function deletePost;
  final Function editPost;

  const PostDetails(this.post, this.deletePost, this.editPost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title!),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              post.image,
              width: 300,
            ),
            Text(post.post!),
            ElevatedButton.icon(
              onPressed: () {
                deletePost(post.id);
              },
              icon: const Icon(Icons.delete),
              label: const Text('delete post'),
            ),
            ElevatedButton.icon(
              onPressed: () => editPost(),
              icon: const Icon(Icons.edit),
              label: const Text('edit post'),
            ),
          ],
        ),
      ),
    );
  }
}
