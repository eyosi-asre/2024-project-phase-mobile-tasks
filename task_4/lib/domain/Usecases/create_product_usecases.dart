import 'package:task_4/domain/entity/product%20.dart';
import 'package:task_4/domain/repositories/product_repositories.dart';
import 'package:task_4/domain/usecase.dart';


class CreateProductUsecase implements UseCase<void, Product> {
  final ProductRepository repository;

  CreateProductUsecase(this.repository);

  @override
  Future<void> call(Product product) {
    return repository.createProduct(product);
  }
}