import 'package:zigy_task/user/user.dart';

class NewUserModel extends NewUser {
  const NewUserModel({
    required super.name,
    required super.job,
    required super.id,
    required super.createdAt,
  });

  factory NewUserModel.fromJson(Map<String, dynamic> json) {
    return NewUserModel(
      name: json['name'],
      job: json['job'],
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
