import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/data_sources/two_ip_data_source.dart';
import 'pages/home/view/home_page.dart';
import 'utils/debug_bloc_observer.dart';

void main() {
  Bloc.observer = DebugBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => Dio(
                BaseOptions(
                  baseUrl: 'https://api.2ip.ua/',
                ),
              ),
            ),
            RepositoryProvider(
              create: (context) => TwoIpDataSource(
                dio: RepositoryProvider.of(context),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomePage(),
          ),
        ),
      );
}
