part of 'universities_bloc.dart';

abstract class UniversitiesState{
  late List<UniversityModel>? universities;
  UniversitiesState([this.universities]);
}

class UniversitiesInitialState extends UniversitiesState{
  UniversitiesInitialState(List<UniversityModel> universities):super(universities);
}

class UniversitiesLoading extends UniversitiesState{
  UniversitiesLoading():super();
}

class UniversitiesSuccessfulState extends UniversitiesState{
  int? page;
  int? limit;
  UniversitiesSuccessfulState (List<UniversityModel> universities,{this.page,this.limit}):super(universities);
}

class UniversitiesErrorState extends UniversitiesState{
  String? message;
  bool isPage;
  UniversitiesErrorState({this.message,this.isPage = false}):super();
}

class UniversitiesNoConnection extends UniversitiesState{
  String? message;
  UniversitiesNoConnection({this.message}):super();
}