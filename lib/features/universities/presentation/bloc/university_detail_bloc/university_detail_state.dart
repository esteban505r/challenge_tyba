part of 'university_detail_bloc.dart';

abstract class UniversityDetailState {
  String? path;

  UniversityDetailState([this.path ]);
}

class UniversityDetailInitialState extends UniversityDetailState {
  UniversityDetailInitialState(String? path) : super(path);
}

class UniversityDetailSuccessfulState extends UniversityDetailState {
  UniversityDetailSuccessfulState(String? path) : super(path);
}
