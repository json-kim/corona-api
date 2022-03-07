import 'dart:async';

import 'package:corona_info/presentation/main/components/corona_list_tile.dart';
import 'package:corona_info/presentation/main/components/vaccine_list_tile.dart';
import 'package:corona_info/presentation/main/main_event.dart';
import 'package:corona_info/presentation/main/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    Future.microtask(() async {
      final viewModel = context.read<MainViewModel>();

      viewModel.uiEventStream.listen((event) {
        event.when(snackBar: (message) {
          final snackBar = SnackBar(content: Text(message));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    final body;
    if (state.isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  viewModel.onEvent(const MainEvent.screenChange(false));
                },
                child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(color: Colors.yellow),
                    child: const Text('지역별 확진자 통계')),
              ),
              InkWell(
                onTap: () {
                  viewModel.onEvent(const MainEvent.screenChange(true));
                },
                child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(color: Colors.green),
                    child: const Text('지역별 백신 접종 통계')),
              ),
            ],
          ),
          Expanded(
            child: state.isVaccineScreen
                ? ListView(
                    children: state.vaccines
                        .map((e) => VaccineListTile(countryVaccine: e))
                        .toList(),
                  )
                : ListView(
                    children: state.countries
                        .map((e) => CoronaListTile(country: e))
                        .toList(),
                  ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('코로나 현황판'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => viewModel.onEvent(const MainEvent.load()),
        child: body,
      ),
    );
  }
}
