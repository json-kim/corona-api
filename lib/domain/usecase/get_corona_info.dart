import 'package:corona_info/core/param/param.dart';
import 'package:corona_info/core/result/result.dart';
import 'package:corona_info/domain/model/country.dart';
import 'package:corona_info/domain/repository/corona_repository.dart';
import 'package:corona_info/domain/usecase/usecase.dart';

class GetCoronaInfo extends UseCase<List<Country>, Param> {
  final CoronaRepository _repository;

  GetCoronaInfo(this._repository);

  @override
  Future<Result<List<Country>>> call(Param param) async {
    final result = await _repository.getCountries();

    return result.when(
      success: (countries) {
        return Result.success(countries);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
