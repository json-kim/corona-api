import 'dart:convert';

import 'package:corona_info/core/constants.dart';
import 'package:corona_info/core/result/result.dart';
import 'package:corona_info/domain/model/country.dart';
import 'package:corona_info/domain/model/vaccine/country_vaccine.dart';
import 'package:corona_info/service/logger_service.dart';
import 'package:http/http.dart' as http;

class CoronaInfoApi {
  Future<Result<List<Country>>> requestCoronaInfo() async {
    final url = Uri.parse(apiUrl);
    final result = await http.get(url);

    if (result.statusCode != 200) {
      final errMessage =
          '$runtimeType.requestCoronaInfo : http status code 에러 발생';
      LoggerService.instance.logger?.e(errMessage);
      return Result.error(errMessage);
    }

    final Map<String, dynamic> jsonBody = jsonDecode(result.body);

    final List<Country> countries = [];

    jsonBody.forEach((key, value) {
      if (key != "resultCode" && key != "resultMessage") {
        countries.add(Country.fromJson(value));
      }
    });

    return Result.success(countries);

    try {} catch (e) {
      LoggerService.instance.logger?.e(e);
      return Result.error('$runtimeType.requestCoronaInfo : http 요청 에러 발생');
    }
  }

  Future<Result<List<CountryVaccine>>> requestVaccineInfo() async {
    final url = Uri.parse(vaccineApiUrl);
    final result = await http.get(url);

    if (result.statusCode != 200) {
      final errMessage =
          '$runtimeType.requestVaccineInfo : http status code 에러 발생';
      LoggerService.instance.logger?.e(errMessage);

      return Result.error(errMessage);
    }

    final Map<String, dynamic> jsonBody = jsonDecode(result.body);

    final List<CountryVaccine> countryVaccines = [];
    jsonBody.forEach((key, value) {
      if (key != 'API') {
        countryVaccines.add(CountryVaccine.fromJson(value));
      }
    });

    return Result.success(countryVaccines);
  }
}
