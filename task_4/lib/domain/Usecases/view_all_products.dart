import 'package:task_4/domain/entity/product%20.dart';
import 'package:task_4/domain/repositories/product_repositories.dart';
import 'package:task_4/domain/usecase.dart';

class NoParams {}

class ViewAllProductsUsecase implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  @override
  Future<List<Product>> call(NoParams params) {
    return repository.getAllProducts();
  }
}