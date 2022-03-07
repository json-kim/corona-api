import 'package:freezed_annotation/freezed_annotation.dart';

part 'param.freezed.dart';

@freezed
class Param<T> with _$Param<T> {
  const factory Param.data(T data) = Data;
  const factory Param.none() = None;
}
