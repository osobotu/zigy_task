import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigy_task/core/core.dart';
import 'package:zigy_task/user/user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required GetUsers getUsers, required CreateUser createUser})
      : _getUsers = getUsers,
        _createUser = createUser,
        super(UsersInitial()) {
    on<GetUsersEvent>(_onGetUsersEvent);
    on<CreateUserEvent>(_onCreateUser);
  }

  final GetUsers _getUsers;
  final CreateUser _createUser;

  Future<void> _onGetUsersEvent(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    final usersEither = await _getUsers(NoParams());
    usersEither.fold(
      (failure) => emit(UsersError()),
      (users) => emit(UsersLoaded(users: users)),
    );
  }

  Future<void> _onCreateUser(
      CreateUserEvent event, Emitter<UsersState> emit) async {
    final newUserEither =
        await _createUser(Params(name: event.name, job: event.job));
    newUserEither.fold(
      (failure) => emit(UsersError()),
      (newUser) => emit(NewUserCreated(newUser: newUser)),
    );
  }
}
