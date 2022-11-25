import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigy_task/user/user.dart';

class NewUserView extends StatelessWidget {
  const NewUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create A New User')),
      body: BlocBuilder<UsersBloc, UsersState>(
        bloc: context.read<UsersBloc>(),
        builder: (context, state) {
          return const NewUserForm();
        },
      ),
    );
  }
}

class NewUserForm extends StatefulWidget {
  const NewUserForm({super.key});

  @override
  State<NewUserForm> createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputField(
              label: 'Name',
              errorText: 'Please enter a name',
              controller: nameController,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Job',
              errorText: 'Please enter the job you do',
              controller: jobController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Submitting Data')),
                    );
                    context.read<UsersBloc>().add(
                          CreateUserEvent(
                              name: nameController.text,
                              job: jobController.text),
                        );
                    jobController.clear();
                    nameController.clear();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
            BlocBuilder(
              bloc: context.read<UsersBloc>(),
              builder: (context, state) {
                if (state is NewUserCreated) {
                  return Text(
                    '${state.newUser.name} with id ${state.newUser.id} created at ${state.newUser.createdAt.toLocal()}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.errorText,
      required this.label,
      required this.controller})
      : super(key: key);

  final String label;
  final String errorText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
