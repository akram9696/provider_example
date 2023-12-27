import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductModel {
  final int? price;
  final String? id;
  final String? type;
  final String? img_src;

  ProductModel({
    required this.type,
    required this.id,
    required this.price,
    required this.img_src
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

extension MapProductModelToDomain on ProductModel {
  Product toDomain() => Product(
    price:price,
    id:id,
    type:type,
    img_src:img_src
  );
}
