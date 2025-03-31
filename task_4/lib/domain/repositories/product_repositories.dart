import 'package:task_4/domain/entity/product%20.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(String id);
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}