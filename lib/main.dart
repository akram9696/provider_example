import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/di/inject.dart';
import 'package:provider_example/features/get_list_provider/presentation/pages/product_page.dart';
import 'package:provider_example/features/get_list_provider/presentation/providers/product_change_notifer.dart';

import 'features/get_list_provider/domain/usecases/product_usecase.dart';

void main() {
  // GetIt sl=GetIt.instance();
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProviderDemoScreen());
  }
}
