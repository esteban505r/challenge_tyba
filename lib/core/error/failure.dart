import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic> properties;
  final String? message;
  const Failure([this.properties = const <dynamic>[],this.message]):super();
  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure{
  ServerFailure([String message = ""]):super([],message);
}

class UnauthorizedFailure extends Failure{
  UnauthorizedFailure([String message = ""]):super([],message);
}