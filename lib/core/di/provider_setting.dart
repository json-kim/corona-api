import 'package:corona_info/data/data_source/remote/corona_info_api.dart';
import 'package:corona_info/data/repository/corona_repository_impl.dart';
import 'package:corona_info/domain/repository/corona_repository.dart';
import 'package:corona_info/domain/usecase/get_corona_info.dart';
import 'package:corona_info/domain/usecase/get_vaccine_info.dart';
import 'package:corona_info/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> setProvider() async {
  List<SingleChildWidget> independetProviders = [
    Provider(
      create: (context) => CoronaInfoApi(),
    ),
  ];
  List<SingleChildWidget> dependentProviders = [
    // repository
    ProxyProvider<CoronaInfoApi, CoronaRepository>(
      update: (context, api, _) => CoronaRepositoryImpl(api),
    ),

    // usecase
    ProxyProvider<CoronaRepository, GetCoronaInfo>(
      update: (context, repository, _) => GetCoronaInfo(repository),
    ),
    ProxyProvider<CoronaRepository, GetVaccineInfo>(
      update: (context, repository, _) => GetVaccineInfo(repository),
    ),
  ];

  List<SingleChildWidget> changeNotifierProviders = [
    ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(
        context.read<GetCoronaInfo>(),
        context.read<GetVaccineInfo>(),
      ),
    ),
  ];

  List<SingleChildWidget> providers = [
    ...independetProviders,
    ...dependentProviders,
    ...changeNotifierProviders,
  ];

  return providers;
}
