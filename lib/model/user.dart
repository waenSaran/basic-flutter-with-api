import 'package:basicflutter/model/user_detail.dart';

class User {
  final String gender;
  final String email;
  final Username name;
  final PictureURL picture;

  User({
    required this.gender,
    required this.email,
    required this.name,
    required this.picture,
  });

  String get fullName {
    return '${name.title}. ${name.first} ${name.last}';
  }
}
