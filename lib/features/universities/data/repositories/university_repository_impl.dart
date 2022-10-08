import 'package:challenge_tyba/features/universities/domain/datasources/university_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/university_repository.dart';
import '../model/university_model.dart';

class UniversityRepositoryImpl implements UniversityRepository {
  final UniversityDataSource _dataSource;

  UniversityRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<UniversityModel>>> getUniversities(
      {int page = 1, int limit = 10}) async {
    try {
      var result = await _dataSource.getUniversities(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
