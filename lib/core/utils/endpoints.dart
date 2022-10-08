import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static final base = dotenv.env['HOST'];
  static final getUniversities = '$base/FE-Engineer-test/universities.json';
}
