import 'package:corona_info/data/data_source/remote/corona_info_api.dart';
import 'package:corona_info/service/logger_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LoggerService.instance.init();
  test('api 가져오는지 테스트', () async {
    final api = CoronaInfoApi();

    final result = await api.requestCoronaInfo();

    result.when(success: (list) {
      LoggerService.instance.logger?.d(list);
    }, error: (message) {
      LoggerService.instance.logger?.e(message);
    });
  });

  test('vaccine api 가져오는지 테스트', () async {
    final api = CoronaInfoApi();

    final result = await api.requestVaccineInfo();

    result.when(success: (list) {
      LoggerService.instance.logger?.d(list);
    }, error: (message) {
      LoggerService.instance.logger?.e(message);
    });
  });
}
