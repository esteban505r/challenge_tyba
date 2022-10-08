class UniversityModel {
  UniversityModel({
    String? alphaTwoCode,
    List<String>? domains,
    String? country,
    dynamic stateprovince,
    List<String>? webPages,
    String? name,
  }) {
    _alphaTwoCode = alphaTwoCode;
    _domains = domains;
    _country = country;
    _stateprovince = stateprovince;
    _webPages = webPages;
    _name = name;
  }

  UniversityModel.fromJson(dynamic json) {
    _alphaTwoCode = json['alpha_two_code'];
    _domains = json['domains'] != null ? json['domains'].cast<String>() : [];
    _country = json['country'];
    _stateprovince = json['state-province'];
    _webPages =
        json['web_pages'] != null ? json['web_pages'].cast<String>() : [];
    _name = json['name'];
  }

  String? _alphaTwoCode;
  List<String>? _domains;
  String? _country;
  dynamic _stateprovince;
  List<String>? _webPages;
  String? _name;

  UniversityModel copyWith({
    String? alphaTwoCode,
    List<String>? domains,
    String? country,
    dynamic stateprovince,
    List<String>? webPages,
    String? name,
  }) =>
      UniversityModel(
        alphaTwoCode: alphaTwoCode ?? _alphaTwoCode,
        domains: domains ?? _domains,
        country: country ?? _country,
        stateprovince: stateprovince ?? _stateprovince,
        webPages: webPages ?? _webPages,
        name: name ?? _name,
      );

  String? get alphaTwoCode => _alphaTwoCode;

  List<String>? get domains => _domains;

  String? get country => _country;

  dynamic get stateprovince => _stateprovince;

  List<String>? get webPages => _webPages;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alpha_two_code'] = _alphaTwoCode;
    map['domains'] = _domains;
    map['country'] = _country;
    map['state-province'] = _stateprovince;
    map['web_pages'] = _webPages;
    map['name'] = _name;
    return map;
  }
}
