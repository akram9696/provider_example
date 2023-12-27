import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/features/get_list_provider/domain/entities/product.dart';

import '../../../../di/inject.dart';
import '../../domain/usecases/product_usecase.dart';
import '../providers/product_change_notifer.dart';

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  final ProductChangeNotifier productProvider = getIt<ProductChangeNotifier>();
  @override
  void initState() {
    super.initState();

    productProvider.fetchNextPage();
  }


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => productProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider Demo"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child:productProvider.loading
              ?const CircularProgressIndicator()
              : productProvider.failure != null?Text(productProvider.failure.toString()) :
          Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            productProvider.products[index].id.toString() ?? ""),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
