import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ui_event.freezed.dart';

@freezed
class MainUiEvent with _$MainUiEvent {
  const factory MainUiEvent.snackBar(String message) = SnackBar;
}
