import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/university_model.dart';

abstract class UniversityRepository{
  Future<Either<Failure,List<UniversityModel>>> getUniversities({int page = 1, int limit = 10});
}