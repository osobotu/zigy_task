import 'package:dartz/dartz.dart';
import 'package:zigy_task/core/core.dart';
import 'package:zigy_task/user/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();

  Future<Either<Failure, NewUser>> createUser(
      {required String name, required String job});
}
