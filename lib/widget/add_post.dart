import 'package:flutter/material.dart';

import 'package:blog_posts/models/post.dart';

class AddPost extends StatefulWidget {
  final Function addPost;

  const AddPost(this.addPost, {super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _titleEditingControler = TextEditingController();
  final _postEditingControler = TextEditingController();

  @override
  void dispose() {
    _titleEditingControler.dispose();
    _postEditingControler.dispose();
    super.dispose();
  }

  _onSubmitHandler() {
    widget.addPost(
      Post(
        title: _titleEditingControler.text,
        post: _postEditingControler.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleEditingControler,
              decoration: const InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: _postEditingControler,
              decoration: const InputDecoration(labelText: 'post'),
            ),
            ElevatedButton(
              onPressed: _onSubmitHandler,
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
