part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
  @override
  List<Object?> get props => [];
}

class GetUsersEvent extends UsersEvent {}

class CreateUserEvent extends UsersEvent {
  final String name;
  final String job;

  const CreateUserEvent({required this.name, required this.job});
  @override
  List<Object?> get props => [];
}
