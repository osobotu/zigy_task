import 'dart:convert';

import 'package:zigy_task/core/core.dart';
import 'package:zigy_task/user/user.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<UserModel>> getUsers();

  Future<NewUserModel> createUser({required String name, required String job});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});
  @override
  Future<NewUserModel> createUser(
      {required String name, required String job}) async {
    final response = await client.post(
      Uri.parse(APIConstants.createUser),
      body: {
        'name': name,
        'job': job,
      },
    );

    if (response.statusCode == 201) {
      final jsonMap = jsonDecode(response.body);
      return NewUserModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get(
      Uri.parse(APIConstants.getUsers),
      headers: APIConstants.headers,
    );

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final data = jsonMap['data'] as List;
      final users = data.map((item) => UserModel.fromJson(item)).toList();
      return users;
    } else {
      throw ServerException();
    }
  }
}
