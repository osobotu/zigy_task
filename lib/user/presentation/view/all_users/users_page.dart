import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigy_task/user/presentation/view/all_users/users_view.dart';

import 'package:zigy_task/user/user.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(
        createUser: CreateUser(context.read<UserRepository>()),
        getUsers: GetUsers(context.read<UserRepository>()),
      )..add(GetUsersEvent()),
      child: UsersView(),
    );
  }
}
