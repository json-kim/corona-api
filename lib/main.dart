import 'package:corona_info/core/di/provider_setting.dart';
import 'package:corona_info/presentation/main/main_screen.dart';
import 'package:corona_info/service/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  LoggerService.instance.init();
  final providers = await setProvider();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveSizer(
        builder: (context, orientation, deviceType) => const MainScreen(),
      ),
    );
  }
}
