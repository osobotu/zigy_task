import 'package:flutter/material.dart';
import 'package:zigy_task/app.dart';
import 'package:zigy_task/user/user.dart';
import 'package:http/http.dart' as http;

void main() {
  final remoteDataSource = RemoteDataSourceImpl(client: http.Client());
  final userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
  runApp(
    App(
      userRepository: userRepository,
    ),
  );
}
