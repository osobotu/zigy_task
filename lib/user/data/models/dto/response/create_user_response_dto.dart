import 'package:zigy_task/user/user.dart';

class CreateUserResponseDto extends NewUser {
  const CreateUserResponseDto({
    required super.name,
    required super.job,
    required super.id,
    required super.createdAt,
  });

  factory CreateUserResponseDto.fromJson(Map<String, dynamic> json) {
    return CreateUserResponseDto(
      name: json['name'],
      job: json['job'],
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
