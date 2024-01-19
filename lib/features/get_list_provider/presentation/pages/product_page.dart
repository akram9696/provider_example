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
  // final productProvider = Provider.of<ProductChangeNotifier>(context);
  // final ProductChangeNotifier productProvider = getIt<ProductChangeNotifier>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductChangeNotifier>(context, listen: false).fetchNextPage();
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Consumer<ProductChangeNotifier>(

        builder: (BuildContext context, value, Widget? child) {
          if (value.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
       return   ListView.builder(
            itemCount: value.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    value.products[index].id.toString() ?? ""),
                subtitle:Text(
                    value.products[index].type.toString() ?? ""),
              );
            },
          );
        },

      ),
    );
  }
}
