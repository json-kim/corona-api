import 'package:corona_info/domain/model/country.dart';
import 'package:corona_info/domain/model/vaccine/country_vaccine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isLoading,
    @Default(false) bool isVaccineScreen,
    @Default([]) List<CountryVaccine> vaccines,
    @Default([]) List<Country> countries,
  }) = _MainState;
}
