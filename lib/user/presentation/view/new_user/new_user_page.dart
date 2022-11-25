import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigy_task/user/presentation/view/new_user/new_user_view.dart';
import 'package:zigy_task/user/user.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(
        createUser: CreateUser(context.read<UserRepository>()),
        getUsers: GetUsers(context.read<UserRepository>()),
      ),
      child: const NewUserView(),
    );
  }
}
