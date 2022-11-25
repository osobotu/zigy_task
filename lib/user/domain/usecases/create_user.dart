import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zigy_task/core/core.dart';
import 'package:zigy_task/user/user.dart';

class CreateUser extends UseCase<NewUser, Params> {
  final UserRepository repository;

  CreateUser(this.repository);
  @override
  Future<Either<Failure, NewUser>> call(params) {
    return repository.createUser(name: params.name, job: params.job);
  }
}

class Params extends Equatable {
  final String name;
  final String job;

  const Params({required this.name, required this.job});
  @override
  List<Object?> get props => [name, job];
}
