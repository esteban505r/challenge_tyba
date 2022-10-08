

import '../../data/model/university_model.dart';

abstract class UniversityDataSource{
  Future<List<UniversityModel>> getUniversities({int page = 1, int limit = 10});
}