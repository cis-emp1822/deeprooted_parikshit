import 'package:deeprooted_parikshit/cubits/cubit/repositories/coins_repo.dart';
import 'package:deeprooted_parikshit/cubits/cubit/search_coins_cubit.dart';
import 'package:deeprooted_parikshit/healers/globals.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deeprooted_parikshit/pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCoinsCubit(
          coinsRepo: CoinsRepo(Dio(BaseOptions(baseUrl: Globals.base_url)))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
