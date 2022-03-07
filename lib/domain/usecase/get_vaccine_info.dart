import 'package:corona_info/core/param/param.dart';
import 'package:corona_info/core/result/result.dart';
import 'package:corona_info/domain/model/vaccine/country_vaccine.dart';
import 'package:corona_info/domain/repository/corona_repository.dart';
import 'package:corona_info/domain/usecase/usecase.dart';

class GetVaccineInfo extends UseCase<List<CountryVaccine>, Param> {
  final CoronaRepository _repository;

  GetVaccineInfo(this._repository);

  @override
  Future<Result<List<CountryVaccine>>> call(Param param) async {
    final result = await _repository.getVaccineCountries();

    return result.when(
      success: (vaccines) {
        return Result.success(vaccines);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
