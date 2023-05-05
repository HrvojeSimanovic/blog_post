import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Post {
  Post({
    this.title,
    this.post,
    this.image = 'assets/images/post_image.jpg',
  }) : id = uuid.v4();

  final String id;
  final String? title;
  final String? post;
  final String image;
}
