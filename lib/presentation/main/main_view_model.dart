import 'dart:async';

import 'package:corona_info/core/param/param.dart';
import 'package:corona_info/domain/usecase/get_corona_info.dart';
import 'package:corona_info/domain/usecase/get_vaccine_info.dart';
import 'package:flutter/material.dart';

import 'main_event.dart';
import 'main_state.dart';
import 'main_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final GetCoronaInfo _getCoronaInfo;
  final GetVaccineInfo _getVaccineInfo;

  final _streamController = StreamController<MainUiEvent>.broadcast();
  Stream<MainUiEvent> get uiEventStream => _streamController.stream;

  MainState _state = MainState();
  MainState get state => _state;

  MainViewModel(this._getCoronaInfo, this._getVaccineInfo) {
    _load();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void onEvent(MainEvent event) {
    event.when(
        load: _load,
        screenChange: (bool isVaccine) {
          _state = _state.copyWith(isVaccineScreen: isVaccine);
          notifyListeners();
        });
  }

  Future<void> _load() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    await _loadCoronaInfo();
    await _loadVaccineInfo();

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> _loadCoronaInfo() async {
    final result = await _getCoronaInfo(const Param.none());

    result.when(success: (countries) {
      _state = _state.copyWith(countries: countries);
    }, error: (message) {
      _streamController.add(MainUiEvent.snackBar(message));
    });
  }

  Future<void> _loadVaccineInfo() async {
    final result = await _getVaccineInfo(const Param.none());

    result.when(
      success: (vaccines) {
        _state = _state.copyWith(vaccines: vaccines);
      },
      error: (message) {
        _streamController.add(MainUiEvent.snackBar(message));
      },
    );
  }
}
