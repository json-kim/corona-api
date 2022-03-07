import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

@freezed
class Country with _$Country {
  const factory Country({
    required String countryName,
    required String newCase,
    required String totalCase,
    required String recovered,
    required String death,
    required String percentage,
    required String newCcase,
    required String newFcase,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
