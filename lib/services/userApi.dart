import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:basicflutter/model/user.dart';
import 'package:basicflutter/model/user_detail.dart';

class UserApi {
  Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
      final name = Username(
          title: user['name']['title'],
          first: user['name']['first'],
          last: user['name']['last']);
      final pic = PictureURL(
          large: user['picture']['large'],
          medium: user['picture']['medium'],
          thumbnail: user['picture']['thumbnail']);
      return User(
          email: user['email'],
          gender: user['gender'],
          name: name,
          picture: pic);
    }).toList();
    return users;
  }
}
