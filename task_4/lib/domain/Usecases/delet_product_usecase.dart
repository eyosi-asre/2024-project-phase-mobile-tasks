import 'package:task_4/domain/repositories/product_repositories.dart';
import 'package:task_4/domain/usecase.dart';

class DeleteProductUsecase implements UseCase<void, String> {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  @override
  Future<void> call(String id) {
    return repository.deleteProduct(id);
  }
}