import 'package:corona_info/core/result/result.dart';
import 'package:corona_info/domain/model/country.dart';
import 'package:corona_info/domain/model/vaccine/country_vaccine.dart';

abstract class CoronaRepository {
  Future<Result<List<Country>>> getCountries();
  Future<Result<List<CountryVaccine>>> getVaccineCountries();
}
