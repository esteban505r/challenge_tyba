part of 'universities_bloc.dart';

@immutable
abstract class UniversitiesEvent {}


class GetUniversitiesEvent extends UniversitiesEvent{
  final int page;
  final int limit;
  GetUniversitiesEvent({this.page = 1, this.limit = 10});
}

