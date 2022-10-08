
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/university_model.dart';
import '../repositories/university_repository.dart';


class GetUniversitiesUseCase{
  final UniversityRepository _universityRepository;

  GetUniversitiesUseCase(this._universityRepository);

  Future<Either<Failure,List<UniversityModel>>> call({int page = 1, int limit = 10}) async {
    return await _universityRepository.getUniversities(page: page,limit: limit);
  }
}