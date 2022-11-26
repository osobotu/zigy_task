import 'package:zigy_task/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:zigy_task/user/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, NewUser>> createUser(
      {required String name, required String job}) async {
    try {
      final newUser = await remoteDataSource.createUser(name: name, job: job);
      return Right(newUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final users = await remoteDataSource.getUsers();
      return Right(users);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
