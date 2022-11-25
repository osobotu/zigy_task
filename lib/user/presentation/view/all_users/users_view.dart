import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigy_task/user/presentation/view/new_user/new_user_page.dart';
import 'package:zigy_task/user/presentation/widgets/loader.dart';
import 'package:zigy_task/user/user.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        bloc: context.read<UsersBloc>(),
        builder: (context, state) {
          if (state is UsersInitial) {
            return const Loader();
          } else if (state is UsersLoaded) {
            return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final item = state.users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.avatar),
                    ),
                    title: Text(item.firstName),
                    subtitle: Text(item.email),
                  );
                });
          } else if (state is UsersError) {
            return const Center(
              child: Text('Error occurred.'),
            );
          } else {
            return const Loader();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewUserPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
