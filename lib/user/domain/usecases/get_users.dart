import 'package:dartz/dartz.dart';
import 'package:zigy_task/core/core.dart';
import 'package:zigy_task/user/user.dart';

class GetUsers extends UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetUsers(this.repository);
  @override
  Future<Either<Failure, List<User>>> call(params) {
    return repository.getUsers();
  }
}
