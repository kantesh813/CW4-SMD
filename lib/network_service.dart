import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    List<dynamic> data = json.decode(response.body);
    return data.map((postJson) => Post.fromJson(postJson)).toList();
  } else {
    // If the server does not return a 200 OK response, throw an exception
    throw Exception('Failed to load posts');
  }
}
