import 'package:yabiso_ecommerce/domain/models/product.dart';

abstract class ProductService {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(int productId);

  Future<Product> createProduct(Product product);

  Future<Product> updateProduct(Product product);

  Future<void> deleteProduct(int productId);
}
