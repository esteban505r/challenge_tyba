
part of 'university_detail_bloc.dart';

abstract class UniversityDetailEvent {}

class ChangeUniversityImageEvent extends UniversityDetailEvent{
  final String? path;
  ChangeUniversityImageEvent({this.path});
}

