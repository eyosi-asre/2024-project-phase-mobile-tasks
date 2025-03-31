class ViewAllProductsUsecase implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  ViewAllProductsUsecase(this.repository);

  @override
  Future<List<Product>> call(NoParams params) {
    return repository.getAllProducts();
  }
}