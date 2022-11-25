import 'package:equatable/equatable.dart';

class NewUser extends Equatable {
  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  const NewUser({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });
  @override
  List<Object?> get props => [name, job, id, createdAt];
}
