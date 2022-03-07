import 'package:corona_info/core/param/param.dart';
import 'package:corona_info/core/result/result.dart';

abstract class UseCase<DataType, ParamType extends Param> {
  Future<Result<DataType>> call(ParamType param);
}
