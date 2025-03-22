import 'package:yabiso_ecommerce/domain/models/product.dart';
import 'package:yabiso_ecommerce/domain/services/ProductService.dart';

class LocalProductServiceImpl extends ProductService {
  final List<Product> products = [
    Product(
      id: 1,
      name: "Apple Watch",
      price: 200.0,
      description: "Apple watch",
      categoryId: 1,
      photo: "assets/images/watch.jpg",
    ),
    Product(
      id: 1,
      name: "Apple iphone",
      price: 200.0,
      description: "Apple watch",
      categoryId: 1,
      photo: "assets/images/iphone.jpg",
    ),
    Product(
      id: 3,
      name: "Apple Airpod",
      price: 200.0,
      description: "Apple watch",
      categoryId: 1,
      photo: "assets/images/airpod.jpg",
    ),
  ];

  @override
  Future<Product> createProduct(Product product) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(int productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProduct(int productId) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts() {
    return Future.value(products);
  }

  @override
  Future<Product> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
