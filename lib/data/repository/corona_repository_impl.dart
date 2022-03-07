import 'package:corona_info/core/result/result.dart';
import 'package:corona_info/data/data_source/remote/corona_info_api.dart';
import 'package:corona_info/domain/model/country.dart';
import 'package:corona_info/domain/model/vaccine/country_vaccine.dart';
import 'package:corona_info/domain/repository/corona_repository.dart';

class CoronaRepositoryImpl with CoronaRepository {
  final CoronaInfoApi _api;

  CoronaRepositoryImpl(this._api);

  @override
  Future<Result<List<Country>>> getCountries() async {
    final result = await _api.requestCoronaInfo();

    return result.when(success: (list) {
      return Result.success(list);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<CountryVaccine>>> getVaccineCountries() async {
    final result = await _api.requestVaccineInfo();

    return result.when(
      success: (list) {
        return Result.success(list);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
