import 'dart:convert';

import 'package:challenge_tyba/core/utils/constants.dart';
import 'package:challenge_tyba/core/utils/endpoints.dart';
import 'package:challenge_tyba/features/universities/data/model/university_model.dart';
import 'package:challenge_tyba/features/universities/domain/datasources/university_data_source.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';

class UniversityDataSourceImpl implements UniversityDataSource {
  @override
  Future<List<UniversityModel>> getUniversities(
      {int page = 1, int limit = 10}) async {
    final response = await http
        .get(
          Uri.parse(Endpoints.getUniversities),
        )
        .timeout(const Duration(seconds: Constants.timeout));

    switch (response.statusCode) {
      case 200:
        return List<UniversityModel>.from(jsonDecode(response.body)
                .map((model) => UniversityModel.fromJson(model)))
            .sublist((page - 1) * 10, 10 * page);
      case 401:
        throw UnauthorizedException();
      default:
        throw ServerException();
    }
  }
}
