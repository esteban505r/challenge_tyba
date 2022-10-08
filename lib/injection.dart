import 'package:challenge_tyba/features/universities/data/datasources/university_data_source_impl.dart';
import 'package:challenge_tyba/features/universities/data/repositories/university_repository_impl.dart';
import 'package:challenge_tyba/features/universities/domain/datasources/university_data_source.dart';
import 'package:challenge_tyba/features/universities/domain/repositories/university_repository.dart';
import 'package:challenge_tyba/features/universities/domain/usecases/get_university_usecase.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/list_type/list_type_bloc.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/universities/universities_bloc.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/university_detail_bloc/university_detail_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Universities
  //Bloc
  sl.registerFactory(() => UniversityBloc(sl()));
  //Use cases
  sl.registerLazySingleton(() => GetUniversitiesUseCase(sl()));
  //Repository
  sl.registerLazySingleton<UniversityRepository>(
      () => UniversityRepositoryImpl(sl()));
  //DataSources
  sl.registerLazySingleton<UniversityDataSource>(
      () => UniversityDataSourceImpl());

  // ListType
  //Bloc
  sl.registerFactory(() => ListTypeBloc());

  // Universities Detail
  sl.registerFactory(() => UniversityDetailBloc());
}
