import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:blog_posts/widget/add_post.dart';
import 'package:blog_posts/widget/posts_list.dart';

import 'package:blog_posts/models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = [
    Post(
      title: 'First Post',
      post: '10 Simple Ways to Boost Your Productivity and Get More Done',
    ),
    Post(
      title: 'Second Post',
      post: 'Why You Should Travel Solo At Least Once In Your Life',
    ),
    Post(
      title: 'Third Post',
      post: 'How to Start a Successful Online Business from Scratch',
    ),
    Post(
      title: 'Fourth Post',
      post: 'The Importance of Self-Care for Mental Health',
    ),
  ];

  _deletePostHanler(String id) {
    setState(() => _posts.removeWhere((element) => element.id == id));
    Navigator.pop(context);
  }

  addPostHandler(Post post) {
    setState(() {
      _posts.add(post);
    });
  }

  _editPostHandler() {
    print('editHandler');
  }

  Future<void> _getPostsHandler() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (final item in data) {
        setState(
          () {
            _posts.add(
              Post(
                title: item['title'],
                post: item['body'],
              ),
            );
          },
        );
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPost(addPostHandler),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
          FilledButton(
            onPressed: _getPostsHandler,
            child: const Text('Get posts from API'),
          )
        ],
        title: const Text('Blog Post'),
      ),
      body: PostsList(
        _posts,
        _deletePostHanler,
        _editPostHandler,
      ),
    );
  }
}
