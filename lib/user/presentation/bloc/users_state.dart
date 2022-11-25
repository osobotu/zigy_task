part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<User> users;

  const UsersLoaded({required this.users});

  @override
  List<Object?> get props => [users];
}

class NewUserCreated extends UsersState {
  final NewUser newUser;

  const NewUserCreated({required this.newUser});

  @override
  List<Object?> get props => [newUser];
}

class UsersError extends UsersState {}
